from django.urls import path

from container_status.views import ContainerStatusList, ContainerStatusListByTrain, ContainerStatusDelete

urlpatterns = [
    path('container_status/list/', ContainerStatusList.as_view(), name='container-status-list'),
    path('container_status/list/<int:pk>/', ContainerStatusListByTrain.as_view(),
         name='container-status-list-by-train'),
    path('container_status/delete/<int:pk>/', ContainerStatusDelete.as_view(), name='container-status-delete'),

]
