from django.urls import path

from terminal.views import TerminalList, ContainersByTerminal, ContainerInTerminalDelete

urlpatterns = [
    path('', TerminalList.as_view(), name='terminal-list'),
    path('container_in_terminal/<int:pk>/', ContainersByTerminal.as_view(), name='container-list-in-terminal'),
    path('container_in_terminal/delete/<int:pk>/', ContainerInTerminalDelete.as_view(),
         name='container-in-terminal-delete'),
]
