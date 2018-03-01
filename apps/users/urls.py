from  django.conf.urls import url
from  .views import UserInfoView,UploadImageView,UpdatePwdView,SendEmailCodeView,UpdateEmailView,MyCourseView,MyFavOrgView,MyFavTeacherView,MyFavCourseView,MyMessageView,LogOutView


app_name = "users"
urlpatterns = [
    url(r'^info/$',UserInfoView.as_view(),name="user_info"),
    #上传头像
    url(r'^image/upload/$',UploadImageView.as_view(),name="image_upload"),
    #更改密码
    url(r'^update/pwd/$', UpdatePwdView.as_view(), name="update_pwd"),
    #发送邮箱验证码
    url(r'^sendemail_code/$', SendEmailCodeView.as_view(), name="sendemail_code"),
    #修改邮箱
    url(r'^update_email/$', UpdateEmailView.as_view(), name="update_email"),
    #个人中心我的课程
    url(r'^mycourse/$', MyCourseView.as_view(), name="mycourse"),
    #我收藏的课程机构
    url(r'^myfav/org/$',MyFavOrgView.as_view(), name="myfav_org"),
    # 我收藏的课程讲师
    url(r'^myfav/teacher/$', MyFavTeacherView.as_view(), name="myfav_teacher"),
    # 我收藏的课程
    url(r'^myfav/course/$', MyFavCourseView.as_view(), name="myfav_course"),
    # 我的消息
    url(r'^my_message/$', MyMessageView.as_view(), name="my_message"),
    #退出登录
    url(r'^logout/$',LogOutView.as_view(),name="logout")
]
