from django.urls import path

from container_status.views import ContainerStatusList, ContainerStatusListByTrain, upload_container_documents, \
    upload_waiting_excel_upload

urlpatterns = [
    path('container_status/list/', ContainerStatusList.as_view(), name='container-status-list'),
    path('container_status/list/<int:pk>/', ContainerStatusListByTrain.as_view(),
         name='container-status-list-by-train'),
    path('upload_container_documents/<int:train_id>/', upload_container_documents, name='upload-container-documents'),
    path('upload_waiting_list_excel/', upload_waiting_excel_upload, name='upload-waiting-list-excel')

]
