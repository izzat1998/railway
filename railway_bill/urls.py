from django.urls import path

from railway_bill.views import RailwayBillList, RailwayBillCreate, RailwayBillUpdate, \
    RailwayBillListbyTrain, RailwayBillDelete, download_zip

urlpatterns = [
    path('', RailwayBillList.as_view(), name='railway-bill-list'),

    path('railway_bill/create', RailwayBillCreate.as_view(), name='railway-bill-create'),
    path('railway_bill/update/<int:pk>/', RailwayBillUpdate.as_view(), name='railway-bill-update'),
    path('railway_bill/delete/<int:pk>/<int:train_id>', RailwayBillDelete.as_view(), name='railway-bill-delete'),

    path('railway_bill/<int:pk>/', RailwayBillListbyTrain.as_view(), name='railway-bill-list-by-train'),

    path('download_zip_file/<int:train_id>/', download_zip, name='railway_download'),

]
