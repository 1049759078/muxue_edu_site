from  django.conf.urls import url

from  .views import CourseListView,CourseDetailView,CourseInfoView,CommentsView,AddCommentsView,VideoPlayView

app_name = "courses"
urlpatterns = [

    url(r'list/',CourseListView.as_view(),name="list"),
    url(r'course/(?P<course_id>\d+)/', CourseDetailView.as_view(), name="course_detail"),
    url(r'^info/(?P<course_id>\d+)/$', CourseInfoView.as_view(), name="course_info"),
    url(r'comments/(?P<course_id>\d+)/$', CommentsView.as_view(), name="course_comments"),
    url(r'add_comment/$', AddCommentsView.as_view(), name="add_comment"),
    url(r'^video/(?P<video_id>\d+)/$', VideoPlayView.as_view(), name="video_play"),
    ]