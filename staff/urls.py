from django.urls import path, include

from staff.views import ClientData, ClientDataByTrain

urlpatterns = [
    path('', ClientData.as_view(), name='client-table-list'),
    path('client/train/<int:pk>/', ClientDataByTrain.as_view(), name='client-table-list-by-train'),
    path('accounts/', include('django.contrib.auth.urls')),
]
