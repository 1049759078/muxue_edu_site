from django.db import models
from  django.contrib.auth.models import AbstractUser
from  datetime import datetime
# Create your models here.

class UserProfile(AbstractUser):
    """扩展用户表"""
    #自定义的性别选择规则

    GENDER_CHOICES= (
        ("male", "男"),
        ("female", "女")
    )
    #昵称
    nike_name = models.CharField(max_length=50,verbose_name="昵称",default="",null=True,blank=True)
    #生日
    birthday = models.DateField(verbose_name="生日",null=True,blank=True)
    #性别,默认为女
    gender = models.CharField(
        max_length=10,
        verbose_name="性别",
        choices=GENDER_CHOICES,
        default="female")
    #地址
    address = models.CharField(max_length=100,verbose_name="地址",default="",null=True,blank=True)
    #电话
    mobile = models.CharField(max_length=11,null=True,blank=True,verbose_name="电话号码")

    #头像
    image = models.ImageField(
        upload_to="image/%Y/%m",
        default="image/default.png",
        max_length=100,
        verbose_name="头像"
    )
    class Meta:
        verbose_name = "用户信息"
        verbose_name_plural = verbose_name

    #重载str方法，打印实例会打印username，username为继承自abstractuser
    def __str__(self):
        return self.username

    # 获取用户未读消息的数量
    def unread_nums(self):
        from  operation.models import UserMessage
        return  UserMessage.objects.filter(has_read=False,user=self.id).count()

class EmailVerifyRecord(models.Model):
    '''邮箱验证码'''

    SEND_CHOICES = (
        ("register","注册"),
        ("forget","找回密码"),
        ("update_email","修改邮箱"),
    )
    code = models.CharField(max_length=20,verbose_name="验证码")
    email = models.EmailField(max_length=50,verbose_name="邮箱")
    send_type = models.CharField(choices=SEND_CHOICES,max_length=20,verbose_name="发送类型")
    send_time = models.DateTimeField(default=datetime.now,verbose_name="发送时间")

    class Meta:
        verbose_name = "邮箱验证码"
        verbose_name_plural = verbose_name

    def __str__(self):
        return '{0}({1})'.format(self.code,self.email)

class Banner(models.Model):
    """轮播图"""

    title = models.CharField(max_length=100,verbose_name="标题")
    image = models.ImageField(
        upload_to="banner/%Y/%m",
        verbose_name="轮播图",
        max_length=100)
    url = models.URLField(max_length=200,verbose_name="访问地址")
    index = models.IntegerField(default=100,verbose_name="顺序")
    add_time = models.DateTimeField(default=datetime.now,verbose_name="添加时间")

    class Meta:
        verbose_name = "轮播图"
        verbose_name_plural = verbose_name

class Server_Tel(models.Model):
    '''服务电话'''
    #服务电话
    server_tel = models.CharField(max_length=20,null=True,blank=True,verbose_name="服务电话")