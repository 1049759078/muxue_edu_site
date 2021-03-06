from django.db import models
from  datetime import datetime

# Create your models here.

class CityDict(models.Model):
    """城市"""
    name = models.CharField(max_length=20,verbose_name="城市")
    desc = models.CharField(max_length=200,verbose_name="描述")
    add_time = models.DateTimeField(default=datetime.now,verbose_name="添加时间")

    class Meta:
        verbose_name = "城市"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class CourseOrg(models.Model):
    """课程机构"""
    ORG_CHOICES = (
        ("pxjg","培训机构"),
        ("gx","高校"),
         ("gr","个人"),
    )
    name = models.CharField(max_length=50,verbose_name="机构名称")
    # 机构描述，后面会替换为富文本展示
    desc = models.TextField(verbose_name="机构描述")
    click_nums = models.IntegerField(default=0,verbose_name="点击数")
    fav_nums = models.IntegerField(default=0,verbose_name="收藏数")
    image = models.ImageField(
        upload_to="org/%Y/%m",
        verbose_name="封面图",
        max_length=100
    )
    address = models.CharField(max_length=150,verbose_name="机构地址")
    city = models.ForeignKey(CityDict,verbose_name="所在城市")
    add_time = models.DateTimeField(default=datetime.now,verbose_name="添加时间")
    category = models.CharField(max_length=20,choices=ORG_CHOICES,verbose_name="机构类别",default="pxjg")
    #当学生点击学习课程，找到所属机构，学习人数+1
    students = models.IntegerField(default=0,verbose_name="学习人数")
    #当发布课程就+1
    course_nums = models.IntegerField(default=0,verbose_name="课程数")
    tag = models.CharField(max_length=20,default="国内名校",verbose_name="机构标签")


    class Meta:
        verbose_name = "课程机构"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

class Teacher(models.Model):
    """讲师表"""
    # 一个机构会有很多老师，所以我们在讲师表添加外键并把课程机构名称保存下来
    # 可以使我们通过讲师找到对应的机构
    org = models.ForeignKey(CourseOrg,verbose_name="所属机构")
    name =  models.CharField(max_length=50,verbose_name="教师名称")
    work_years = models.IntegerField(default=0,verbose_name="工作年限")
    work_company = models.CharField(max_length=50,verbose_name="就职公司")
    work_position = models.CharField(max_length=50,verbose_name="公司职位")
    points = models.CharField(max_length=50,verbose_name="教学特点")
    click_nums = models.IntegerField(default=0,verbose_name="点击数")
    fav_nums = models.IntegerField(default=0,verbose_name="收藏数")
    add_time = models.DateTimeField(default=datetime.now,verbose_name="添加时间")
    age = models.IntegerField(default=10,verbose_name="年龄")
    image = models.ImageField(
        default="",
        upload_to="teacher/%Y/%m",
        verbose_name="头像",
        max_length=100,
    )

    class Meta:
        verbose_name = "讲师"
        verbose_name_plural = verbose_name

    def __str__(self):
        return "[{0}]的教师: {1}".format(self.org, self.name)