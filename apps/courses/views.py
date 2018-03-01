from django.shortcuts import render,HttpResponse
from django.views.generic.base import View
from django.contrib.auth.mixins import LoginRequiredMixin
from  django.db.models import Q
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from .models import Course,CourseOrg,CourseResource,Teacher,Video
from  operation.models import UserFavorite,UserAsk,CourseComments,UserCourse
from  users.models import Server_Tel
# Create your views here.

class CourseListView(View):
    '''课程列表页'''
    def get(self,request):
        all_course = Course.objects.all()
        #服务电话
        server_tel = Server_Tel.objects.all().first()
        # 进行排序
        sort = request.GET.get("sort", "")
        if sort:
            if sort == "students":
                all_course = all_course.order_by("-students")
            elif sort == "hot":
                all_course = all_course.order_by("-click_nums")
            elif sort == "":
                all_course = all_course.order_by("-add-time")
        #热门课程推荐
        hot_courses = Course.objects.all().order_by("-students")[:3]
        #课程搜索功能
        search_keywords = request.GET.get("keywords","")
        if search_keywords:
            #在name字段进行搜索，做like语句操作，i代表不区分大小写
            #or操作使用Q
            all_course = all_course.filter(Q(name__icontains=search_keywords)|Q(desc__icontains=search_keywords)|Q(detail__icontains=search_keywords))

        #进行分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
            # 这里指从allorg中取五个出来，每页显示3个
        p = Paginator(all_course, 3, request=request)
        courses = p.page(page)


        return render(request,'course-list.html',{"all_course":courses,
                                                  "sort":sort,
                                                  "hot_courses":hot_courses,
                                                  "search_keywords":search_keywords,
                                                  "server_tel":server_tel,

                                             })

class CourseDetailView(View):
    def get(self,request,course_id):
        course = Course.objects.get(id = int(course_id))
        # 增加课程点击数
        course.click_nums += 1
        course.save()
        tag = course.tag
        if tag:
            #需要从1开始不然会推荐自己
            relate_courses = Course.objects.filter(tag=tag)[1:2]
        else:
            relate_courses = []
        # 是否收藏课程
        has_fav_course = False
        has_fav_org = False

        # 必须是用户已登录我们才需要判断。
        if request.user.is_authenticated:
            if UserFavorite.objects.filter(user=request.user, fav_id=course.id, fav_type=1):
                has_fav_course = True
            if UserFavorite.objects.filter(user=request.user, fav_id=course.course_org.id, fav_type=2):
                has_fav_org = True
        return render(request,"course-detail.html",{"course":course,
                                                    "relate_courses":relate_courses,
                                                    "has_fav_course":has_fav_course,
                                                    "has_fav_org":has_fav_org,
                                                    })

class CourseInfoView(LoginRequiredMixin,View):
    '''课程章节信息页面'''
    '''相关课程推荐'''
    login_url = '/login/'
    redirect_field_name = 'redirect_to'
    def get(self,request,course_id):
        course = Course.objects.get(id = int(course_id))
        #学习资料
        all_resources = CourseResource.objects.filter(course=course)

        #选出学了这门课的学生关系
        user_courses = UserCourse.objects.filter(course=course)
        #点击数 +1
        if not user_courses:
            user_course = UserCourse(user=request.user, course=course)
            course.students += 1
            course.save()
            user_course.save()
        #从关系中取出user_id
        user_ids = [user_course.user_id for user_course in user_courses]
        #这些用户学了的课程，外键会自动有id，取到字段
        all_user_courses = UserCourse.objects.filter(user_id__in=user_ids)
        #取出所有课程id
        course_ids = [all_user_course.course_id for all_user_course in all_user_courses]
        #获取学过该课程用户学过的其他课程
        relate_courses = Course.objects.filter(id__in=course_ids).order_by("-click_nums")[:5]
        #是否收藏课程

        return  render(request,'course-video.html',{
            "course":course,
            "all_resources":all_resources,
            "relate_courses":relate_courses,
        })
class CommentsView(LoginRequiredMixin,View):
    '''课程评论信息页面'''
    login_url = '/login/'
    redirect_field_name = 'next'
    def get(self,request,course_id):
        course = Course.objects.get(id = int(course_id))
        all_resources = CourseResource.objects.filter(course=course)
        all_comments = CourseComments.objects.filter(course=course).order_by("-add_time")
        # 选出学了这门课的学生关系
        user_courses = UserCourse.objects.filter(course=course)
        # 从关系中取出user_id
        user_ids = [user_course.user_id for user_course in user_courses]
        # 这些用户学了的课程，外键会自动有id，取到字段
        all_user_courses = UserCourse.objects.filter(user_id__in=user_ids)
        # 取出所有课程id
        course_ids = [all_user_course.course_id for all_user_course in all_user_courses]
        # 获取学过该课程用户学过的其他课程
        relate_courses = Course.objects.filter(id__in=course_ids).order_by("-click_nums")[:5]
        # 是否收藏课程
        return  render(request,'course-comment.html',{
            "course":course,
            "all_resources":all_resources,
            "all_comments":all_comments,
            "relate_courses": relate_courses,
        })

class AddCommentsView(View):
    '''ajax方式添加评论'''
    def post(self,request):
        if not request.user.is_authenticated:
            #未登录时放回json提示没登录，跳转到登录页面是在ajax中做的
            return  HttpResponse('{"status":"fail","msg":"用户未登录"}',content_type='application/json')
        course_id = request.POST.get("course_id",0)
        comments = request.POST.get("comments","")
        if int(course_id) > 0 and comments:
            course_comments = CourseComments()
            #get只能取出一条数据，如果有多条会抛出异常，没有数据也会抛出异常
            #filter取出一个列表出来，queryset，没有数据返回空的queryset不会抛出异常
            course = Course.objects.get(id = int(course_id))
            #外键存入要存入的对象
            course_comments.course = course
            course_comments.comments = comments
            course_comments.user = request.user
            course_comments.save()
            return HttpResponse('{"status":"success","msg":"评论成功"}',content_type='application/json')
        else:
            return HttpResponse('{"status":"success","msg":"评论失败"}', content_type='application/json')

class VideoPlayView(LoginRequiredMixin,View):
    '''播放视频'''
    login_url = '/login'
    redirect_field_name = 'next'
    def get(self,request,video_id):
        #此处的id为表默认为我们添加的值
        video = Video.objects.get(id = int(video_id))
        #找到对应的course
        course = video.lesson.course
        #查询用户是否开始学习了该课程，如果还未学习则加入课程表
        user_courses = UserCourse.objects.filter(user=request.user,course=course)
        if not user_courses:
            user_course = UserCourse(user=request.user,course=course)
            user_course.save()
        #查询课程资源
        all_resourses = CourseResource.objects.filter(course=course)
        #选出学了这门课的学生关系
        user_courses = UserCourse.objects.filter(course=course)
        #从关系中取出user_id
        user_ids = [user_course.user_id for user_course in user_courses]
        #这些用户学了的课程，外键会自动有id，取到字段
        all_user_courses = UserCourse.objects.filter(user_id__in=user_ids)
        #取出所有的课程id
        course_ids = [user_course.course_id for user_course in all_user_courses]
        #获取学过该课程用户学过的其他课程
        relate_courses = Course.objects.filter(id__in=course_ids).order_by("-click_nums")
        #是否收藏课程
        return render(request,'course-play.html',{
            "course":course,
            "all_resources":all_resourses,
            "relate_courses":relate_courses,
            "video":video,
        })
