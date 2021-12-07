from django.urls import path

from terminal.views import TerminalList, ContainersByTerminal,\
    upload_container_in_terminal_documents, ContainerInTerminalUpdate, ContainerInTerminalSendWaitingList

urlpatterns = [
    path('', TerminalList.as_view(), name='terminal-list'),
    path('container_in_terminal/<int:pk>/', ContainersByTerminal.as_view(), name='container-list-in-terminal'),
    path('container_in_terminal/delete/<int:pk>/', ContainerInTerminalSendWaitingList.as_view(),
         name='container-in-terminal-delete'),
    path('container_in_terminal/update/<int:pk>/', ContainerInTerminalUpdate.as_view(),
         name='container-in-terminal-update'),
    path('container_in_terminal/documents_upload/', upload_container_in_terminal_documents,
         name='upload-container-in-terminal-documents')
]
