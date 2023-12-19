from rest_framework.routers import DefaultRouter

from main import views

router = DefaultRouter()
router.register(r'', views.TaskModelViewSet, basename='user')

urlpatterns = router.urls
