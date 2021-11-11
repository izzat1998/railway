from django.contrib import admin
from django.urls import path, include

from train.views import TrainList, TrainCreate, TrainUpdate, TrainDelete, TrainUpload

urlpatterns = [
    path('', TrainList.as_view(), name='train-list'),
    path('train_create/', TrainCreate.as_view(), name='train-create'),
    path('train_update/<int:pk>/', TrainUpdate.as_view(), name='train-update'),
    path('train_delete/<int:pk>/', TrainDelete.as_view(), name='train-delete'),
    # pre-upload
    path('train_pre_upload/<int:pk>/', TrainUpload.as_view(), name='train-pre-upload-excel'),
    path('train_pre_upload/', TrainUpload.as_view(), name='train-upload-excel'),
]
