from django.contrib import admin
from django.urls import path, include

from train.views import TrainList, TrainCreate, TrainUpdate, TrainDelete, TrainsByTerminal, \
     TrainCalendar

urlpatterns = [
    # Terminals
    path('trains/<int:pk>/', TrainsByTerminal.as_view(), name='train-list-by-terminal'),
    path('', TrainList.as_view(), name='train-list'),
    path('train_create/', TrainCreate.as_view(), name='train-create'),
    path('train_update/<int:pk>/', TrainUpdate.as_view(), name='train-update'),
    path('train_delete/<int:pk>/', TrainDelete.as_view(), name='train-delete'),


    # train_calendar
    path('train_calendar/',TrainCalendar.as_view(), name='train-calendar'),
]
