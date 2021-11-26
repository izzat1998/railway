from django.urls import path

from api.views import ContainerInTerminalCreate

urlpatterns = [
    path('container_in_terminal_create/', ContainerInTerminalCreate.as_view(), name='container_in_terminal_create'),
]
