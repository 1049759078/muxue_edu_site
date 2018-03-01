from django.db import models
from datetime import datetime

from organization.models import CourseOrg,Teacher
# Create your models here.

class Course(models.Model):
    """课程信息表"""

    DEGREE_CHOICES=(
        ("cj", "初级"),
        ("zj", "中级"),
        ("gj", "高级")
    )
    name = models.CharField(max_length=50,verbose_name="课程名")
    desc = models.CharField(max_length=300,verbose_name="课程描述")
    detail = models.TextField(verbose_name="课程详情")
    degree = models.CharField(choices=DEGREE_CHOICES,max_length=2,verbose_name="难度")
    learn_times = models.IntegerField(default=0,verbose_name="学习时长(分钟数)")
    students = models.IntegerField(default=0,verbose_name="学习人数")
    fav_nums = models.IntegerField(default=0,verbose_name="收藏人数")
    image = models.ImageField(
        upload_to="courses/%Y/%m",
        verbose_name="封面图",
        max_length=100
    )
    click_nums = models.IntegerField(default=0,verbose_name="点击数")
    add_time = models.DateTimeField(default=datetime.now,verbose_name="添加时间")
    course_org = models.ForeignKey(CourseOrg,verbose_name="所属机构",null=True,blank=True)
    category = models.CharField(max_length=20,default="",verbose_name="课程类别")
    tag = models.CharField(max_length=15,default="",verbose_name="课程标签")
    teacher = models.ForeignKey(Teacher,verbose_name="讲师",null=True,blank=True)
    you_need_know = models.CharField(max_length=300,default="爱学习",verbose_name="课程须知")
    teacher_tell = models.CharField(max_length=300,default="考试洛",verbose_name="老师告诉你")
    is_banner = models.BooleanField(default=False,verbose_name="是否轮播")

    class Meta:
        verbose_name = "课程"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class Lesson(models.Model):
    """章节"""
    # 因为一个课程对应很多章节。所以在章节表中将课程设置为外键。
    # 作为一个字段来让我们可以知道这个章节对应那个课程
    course = models.ForeignKey(Course,verbose_name="课程")
    name = models.CharField(max_length=100,verbose_name="章节名")
    add_time = models.DateTimeField(default=datetime.now,verbose_name="添加时间")


    class Meta:
        verbose_name = "章节"
        verbose_name_plural = verbose_name

    def __str__(self):
        return '《{0}》课程的章节 >> {1}'.format(self.course, self.name)

class Video(models.Model):
    """章节视频表"""
    # 因为一个章节对应很多视频。所以在视频表中将章节设置为外键。
    # 作为一个字段来存储让我们可以知道这个视频对应哪个章节.
    lesson = models.ForeignKey(Lesson,verbose_name="章节")
    name = models.CharField(max_length=100,verbose_name="视频名")
    add_time = models.DateTimeField(default=datetime.now,verbose_name="添加时间")
    #使用分钟做后台记录（存储最小单位）前台转换
    learn_times = models.IntegerField(default=0,verbose_name="学习时长(分钟数)")
    url = models.CharField(max_length=200, default="https://www.cnblogs.com/guigujun", verbose_name="访问地址")

    class Meta:
        verbose_name = "视频"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

class CourseResource(models.Model):
    """课程资源表"""

    course = models.ForeignKey(Course,verbose_name="课程")
    name = models.CharField(max_length=100,verbose_name="名称")
    download = models.FileField(
        upload_to="course/resource/%Y/%m",
        verbose_name="资源文件",
        max_length=100
    )
    add_time = models.DateTimeField(default=datetime.now,verbose_name="添加时间")


    class Meta:
        verbose_name = "课程资源"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name
