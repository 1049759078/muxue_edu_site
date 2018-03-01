from django.shortcuts import render,HttpResponse,HttpResponseRedirect,Http404,reverse
from django.contrib.auth import authenticate,login,logout
from  django.contrib.auth.backends import ModelBackend
#并集运算
from django.db.models import Q
from django.views.generic.base import View
from django.contrib.auth.hashers import make_password
from  django.contrib.auth.mixins import LoginRequiredMixin

from pure_pagination.paginator import Paginator,PageNotAnInteger

from .models import UserProfile,EmailVerifyRecord,Banner,Server_Tel
from .forms import LoginForm,RegisterForm,ActiveForm,ForgetForm,ModifPwdForm,UploadImageForm,UserInfoForm
from  utils.email_send import send_register_eamil
from  operation.models import UserCourse,UserFavorite,UserMessage
from  organization.models import CourseOrg,Teacher
from  courses.models import Course
import  json


# Create your views here.

def user_login(request):
    '''用戶登錄'''
    if request.method == "POST":
        username = request.POST.get("username","")
        password = request.POST.get("password","")
        user = authenticate(username=username,password=password)
        # 如果不是null说明验证成功
        if user is not None:
            # login_in 两参数：request, user
            # 实际是对request写了一部分东西进去，然后在render的时候：
            # request是要render回去的。这些信息也就随着返回浏览器。完成登录
            login(request,user)
            return render(request,"index.html")

        else:
            # 没有成功说明里面的值是None，并再次跳转回主页面
            return render(request, 'login.html',{"msg":"用户名或密码错误! "})

    # 获取登录页面为get
    elif request.method == "GET":
        # render就是渲染html返回用户
        # render三变量: request 模板名称 一个字典写明传给前端的值
        return render(request,'login.html',{})

class LoginView(View):
    '''基于类实现用户登录'''
    #直接调用get方法免去判断
    def get(self,request):
        # render就是渲染html返回用户
        # render三变量: request 模板名称 一个字典写明传给前端的值
        redirect_url = request.GET.get('next', '')
        return render(request,'login.html',{"redirect_url":redirect_url,})
    def post(self,request):
        # 类实例化需要一个字典参数dict:request.POST就是一个QueryDict所以直接传入
        # POST中的username,password，会对应到form中
        login_form = LoginForm(request.POST)
        # is_valid判断我们字段是否有错执行我们原有逻辑，验证失败跳回login页面
        if login_form.is_valid():
            # 取不到时为空，username，password为前端页面name值
            username = request.POST.get("username","")
            password = request.POST.get("password","")
            # 成功返回user对象,失败返回null
            user = authenticate(username=username,password=password)
            # 如果不是null说明验证成功
            if user is not None:
                # login_in 两参数：request, user
                # 实际是对request写了一部分东西进去，然后在render的时候：
                # request是要render回去的。这些信息也就随着返回浏览器。完成登录
                login(request,user)
                # 跳转到首页 user request会被带回到首页
                redirect_url = request.POST.get('next', '')
                if redirect_url:
                    return HttpResponseRedirect(redirect_url)
                # 跳转到首页 user request会被带回到首页
                return HttpResponseRedirect(reverse("index"))
        else:
            # 没有成功说明里面的值是None，并再次跳转回主页面
            return render(request,'login.html',{"msg":"用户名或密码错误","login_form":login_form})





class CustomBackend(ModelBackend):
    '''实现邮箱或密码均可登录
    继承ModelBackend类，因为它有方法authenticate
    '''
    def authenticate(self, request, username=None, password=None, **kwargs):
        try:
            #不希望用户存在两个，get只能有一个，两个是get失败的一种原因 Q为使用并集查询
            user = UserProfile.objects.get(Q(username=username)|Q(email=username))
            # django的后台中密码加密：所以不能password==password
            # UserProfile继承的AbstractUser中有def check_password(self, raw_password):
            if user.check_password(password):
                return user
        except Exception as e:
            return None

class RegisterView(View):
    '''基于类实现注册功能'''
    def get(self,request):
        #get方法直接返回注册页面
        register_form = RegisterForm()
        return render(request,'register.html',{"register_form":register_form})

    def post(self,request):
        register_form = RegisterForm(request.POST)
        if register_form.is_valid():
            username = request.POST.get("email","")
            password = request.POST.get("password","")
            # 实例化一个user_profile对象，将前台值存入
            user_profile = UserProfile()
            user_profile.username = username
            user_profile.email = username
            #加密password保存
            user_profile.password = make_password(password)
            # 默认激活状态为false
            user_profile.is_active =False
            user_profile.save()
            #写入欢迎注册消息
            user_message = UserMessage()
            user_message.user = user_profile.id
            user_message.message = "欢迎注册慕学网站点!! --系统自动消息"
            user_message.save()
            # 发送注册激活邮件
            send_register_eamil(username,"register")
            return render(request,'login.html')
        return render(request,'register.html',{"register_form":register_form})

class ActiveUserView(View):
    '''激活用户'''
    def get(self,request,active_code):
        all_record = EmailVerifyRecord.objects.filter(code=active_code)
        active_form = ActiveForm(request.GET)
        #如果不为空也就是有用户
        if all_record:
            for record in all_record:
                #获取到对应的邮箱
                email = record.email
                #查找邮箱对应的user
                user = UserProfile.objects.get(email=email)
                user.is_active = True
                user.save()
                #激活成功后跳转到登录页面
                return render(request,'login.html',)
        else:
            #自己瞎输的验证码
            return render(request,'register.html',{"msg":"您的激活链接无效","active_form":active_form})

class ForgetPwdView(View):
    '''忘记密码view'''
    def get(self,request):
        forget_form = ForgetForm()
        return render(request,'forgetpwd.html',{"forget_form":forget_form})
    def post(self,request):
        forget_form = ForgetForm(request.POST)
        #form验证合法情况下取出email
        if forget_form.is_valid():
            email = request.POST.get("email","")
            #发送找回密码邮件
            send_register_eamil(email,"forget")
            #发送完毕返回登录页面并显示发送邮件成功
            return render(request,'login.html',{"msg":"重置密码邮件已发送,请注意查收"})
        #如果表单验证失败也就是验证码输错等
        else:
            return render(request,'forgetpwd.html',{"forget_form":forget_form})

class ResetView(View):
    '''重置密码'''
    def get(self,request,active_code):
        #查询邮箱记录是否存在
        all_record = EmailVerifyRecord.objects.filter(code=active_code)
        #如果不为空也就是有用户
        active_form = ActiveForm(request.GET)
        if all_record:
            for recird in all_record:
                #获取到对应的邮箱
                email = recird.email
                #将email传回来
                return render(request,"password_reset.html",{"email":email})
        #自己瞎输的验证码
        else:
            return render(request,"forgetpwd.html",{"msg":"您的重置密码链接无效,请重新请求","active_form":active_form})

class ModfyPwdView(View):
    '''改变密码'''
    def post(self,request):
        modiypwd_form = ModifPwdForm(request.POST)
        if modiypwd_form.is_valid():
            pwd1 = request.POST.get("password1","")
            pwd2 =  request.POST.get("password2","")
            email = request.POST.get("email","")
            #如果两次密码不相等，返回错误信息
            if pwd1 != pwd2:
                return render(request,'password_reset.html',{"msg":"密码不一致","email":email})
            #如果密码一致
            user = UserProfile.objects.get(email=email)
            #加密成密文
            user.password=make_password(pwd2)
            #保存
            user.save()
            return render(request,'login.html',{"msg":"密码修改成功,请登录"})
        #验证失败说明密码位数不够
        else:
            email = request.POST.get("email","")
            return render(request,'password_reset.html',{"email":email,"modiypwd_form":modiypwd_form})

class UserInfoView(LoginRequiredMixin,View):
    '''用户个人中心'''
    login_url = '/login'
    redirect_field_name = 'next'
    def get(self,request):
        #服务电话
        server_tel = Server_Tel.objects.all().first()

        return  render(request,'usercenter-info.html',{"server_tel":server_tel,})
    def post(self,request):
        # 不像用户咨询是一个新的。需要指明instance。不然无法修改，而是新增用户
        user_info_form = UserInfoForm(request.POST,instance=request.user)
        if user_info_form.is_valid():
            user_info_form.save()
            return HttpResponse(
                '{"status":"success"}',
                content_type='application/json')
        else:
            # 通过json的dumps方法把字典转换为json字符串
            return HttpResponse(
                json.dumps(
                    user_info_form.errors),
                content_type='application/json')
class UploadImageView(LoginRequiredMixin,View):
    '''用户上传图片，用于修改头像'''
    login_url = '/login'
    redirect_field_name = 'next'
    def post(self,request):
        #这时候用户上传的文件就已经保存到imageform了,为modelform添加instance值直接保存
        image_form = UploadImageForm(request.POST,request.FILES,instance=request.user)
        if image_form.is_valid():
            image_form.save()
            #取出cleaned_data中的值，一个dict
            #image = image_form.cleaned_data['image']
            #request.user.image = image
            #request.user.save()
            return HttpResponse('{"status":"success"}',content_type='application/json')
        else:
            return HttpResponse('{"status":"fail"}', content_type='application/json')

class UpdatePwdView(LoginRequiredMixin,View):
    '''个人中心 修改密码'''
    login_url = '/login/'
    redirect_field_name = 'next'
    def post(self,request):
        modiypwd_form = ModifPwdForm(request.POST)
        if modiypwd_form.is_valid():
            pwd1 = request.POST.get("password1","")
            pwd2 = request.POST.get("password2","")
            #如果两次密码不相等，返回错误信息
            if pwd1 != pwd2:
                return  HttpResponse('{"status":"fail","msg":"密码不一致"}',content_type='application/json')
            #如果密码一致
            user = request.user
            #加密密码
            user.password = make_password(pwd2)
            #save保存到数据库
            user.save()
            return HttpResponse('{"status":"success"}',content_type='application/json')
        else:
            #验证失败
            return HttpResponse('{"status":"fail","msg":"填写错误请检查"}', content_type='application/json')


class SendEmailCodeView(LoginRequiredMixin,View):
    '''发送邮箱验证码'''
    def get(self,request):
        #取出需要发送的邮件
        email = request.GET.get("email","")
        #不能是已经注册的邮箱
        if UserProfile.objects.filter(email=email):
            return HttpResponse('{"email":"邮箱已经存在"}',content_type='application/json')
        send_register_eamil(email,"update_email")
        return HttpResponse('{"email":"success"}',content_type='application/json')

class UpdateEmailView(LoginRequiredMixin,View):
    login_url = '/login/'
    redirect_field_name = 'next'
    def post(self,request):
        email = request.POST.get("email","")
        code = request.POST.get("code","")
        existed_records = EmailVerifyRecord.objects.filter(email=email,code=code,send_type='update_email')
        if existed_records:
            user = request.user
            user.email = email
            user.save()
            return  HttpResponse('{"status":"success"}',content_type='application/json')
        else:
            return HttpResponse('{"email":"验证码无效"}', content_type='application/json')


class MyCourseView(LoginRequiredMixin,View):
    '''个人中心我的课程'''
    login_url = '/login/'
    redirect_field_name = 'next'
    def get(self,request):
        user_courses = UserCourse.objects.filter(user=request.user)
        return render(request,'usercenter-mycourse.html',{
            "user_courses":user_courses,
        })

class MyFavOrgView(LoginRequiredMixin,View):
    '''个人中心我的收藏，收藏机构'''
    login_url = '/login/'
    redirect_field_name = 'next'

    def get(self, request):
        org_list = []
        fav_orgs = UserFavorite.objects.filter(user=request.user, fav_type=2)
        print(fav_orgs)
        # 上面的fav_orgs只是存放了id。我们还需要通过id找到机构对象
        for fav_org in fav_orgs:
            # 取出fav_id也就是机构的id。
            org_id = fav_org.fav_id
            print(org_id)
            # 获取这个机构对象
            org = CourseOrg.objects.get(id=org_id)
            print(org)
            org_list.append(org)
        return render(request, "usercenter-fav-org.html", {
            "org_list": org_list,
        })

class MyFavTeacherView(LoginRequiredMixin, View):
    login_url = '/login/'
    redirect_field_name = 'next'

    def get(self, request):
        teacher_list = []
        fav_teachers= UserFavorite.objects.filter(user=request.user, fav_type=3)
        # 上面的fav_orgs只是存放了id。我们还需要通过id找到机构对象
        for fav_teacher in fav_teachers:
            # 取出fav_id也就是机构的id。
            teacher_id = fav_teacher.fav_id
            # 获取这个机构对象
            teacher = Teacher.objects.get(id=teacher_id)
            teacher_list.append(teacher)
        return render(request, "usercenter-fav-teacher.html", {
            "teacher_list": teacher_list,
        })

class MyFavCourseView(LoginRequiredMixin, View):
    login_url = '/login/'
    redirect_field_name = 'next'

    def get(self, request):
        course_list = []
        fav_courses = UserFavorite.objects.filter(user=request.user, fav_type=1)
        # 上面的fav_orgs只是存放了id。我们还需要通过id找到机构对象
        for fav_course in fav_courses:
            # 取出fav_id也就是机构的id。
            course_id = fav_course.fav_id
            # 获取这个机构对象
            course = Course.objects.get(id=course_id)
            course_list.append(course)
        return render(request, "usercenter-fav-course.html", {
            "course_list": course_list,
        })

class MyMessageView(LoginRequiredMixin,View):
    '''个人中心，我的消息'''
    login_url = '/login/'
    redirect_field_name = 'next'
    def get(self,request):
        all_message = UserMessage.objects.filter(user=request.user.id).order_by("-add_time")
        # 用户进入个人中心消息页面，清空未读消息记录
        all_unread_messages = UserMessage.objects.filter(user=request.user.id,has_read=False)

        for all_unread_message in all_unread_messages:
            all_unread_message.has_read = True
            all_unread_message.save()
        #对消息进行分页
        # 尝试获取前台get请求传递过来的page参数
        # 如果是不合法的配置参数默认返回第一页
        try:
            page = request.GET.get("page",1)
        except PageNotAnInteger:
            page = 1
        #这里从消息中取出五个出来，每页显示5个
        p = Paginator(all_message,4)
        messages = p.page(page)
        return  render(request,'usercenter-message.html',{
            "messages":messages,
        })

class LogOutView(LoginRequiredMixin,View):
    '''退出登录'''
    def get(self,request):
        #django自带的logout
        logout(request)
        #重定向到首页
        return  HttpResponseRedirect(reverse("index"))

class IndexView(View):
    def get(self,request):
        #轮播图
        all_banner = Banner.objects.all().order_by('index')[:5]
        #公开课课程
        courses = Course.objects.filter(is_banner=False)[:6]
        #轮播图课程取三个
        banner_courses = Course.objects.filter(is_banner=True)[:3]
        #课程机构
        course_orgs = CourseOrg.objects.all()[:15]
        #服务电话
        server_tel = Server_Tel.objects.all().first()
        return  render(request,'index.html',{
            "all_banner":all_banner,
            "courses":courses,
            "banner_courses":banner_courses,
            "course_orgs":course_orgs,
            "server_tel":server_tel,
        })

def page_not_found(request):
    '''404处理'''
    from  django.shortcuts import render_to_response
    response = render_to_response("404.html",{})
    #设置response的状态码
    response.status_code = 404
    return response