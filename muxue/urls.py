"""muxue URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url,include
from django.contrib import admin
import xadmin
from django.views.generic import TemplateView
from users.views import user_login,LoginView,RegisterView,ActiveUserView,ForgetPwdView,ResetView,ModfyPwdView,IndexView
from organization.views import OrgView
from muxue.settings import MEDIA_ROOT

from django.views.static import serve

handler404 = 'users.views.page_not_found'
urlpatterns = [
    # url(r'^admin/', admin.site.urls),
    url(r'^xadmin/', xadmin.site.urls),
    url(r'^$',IndexView.as_view(),name="index"),
    # url(r'^login/$',user_login,name="login")
    url(r'^login/', LoginView.as_view(), name="login"),
    url(r'^register/', RegisterView.as_view(), name="register"),
    url(r'^captcha/', include('captcha.urls')),
    url(r'^active/(?P<active_code>.*)/$', ActiveUserView.as_view(), name="user_active"),
    url('forget/',ForgetPwdView.as_view(),name="forget_pwd"),
    url(r'^reset/(?P<active_code>.*)/$',ResetView.as_view(),name="reset_pwd"),
    url(r'^modify_pwd/$',ModfyPwdView.as_view(), name="modify_pwd"),


    #机构
    # url(r'^org_list/$',OrgView.as_view(),name="org_list"),
    url(r'^org/',include('organization.urls',namespace="org")),
    url(r'^course/', include('courses.urls', namespace="course")),
    # 处理图片显示的url,使用Django自带serve,传入参数告诉它去哪个路径找，我们有配置好的路径MEDIAROOT
    url(r'^media/(?P<path>.*)$',serve, {"document_root": MEDIA_ROOT }),
    #用户中心
    url(r'^users/',include('users.urls',namespace="users")),
]
