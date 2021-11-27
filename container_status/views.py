from django.http import HttpResponseRedirect
from django.shortcuts import render

# Create your views here.
from django.urls import reverse_lazy
from django.views.generic import ListView

from container_status.helper import upload_container_documents_by_train, read_excel_create_waiting_list
from container_status.models import ContainerStatus


class ContainerStatusList(ListView):
    model = ContainerStatus
    context_object_name = 'container_status_list'
    template_name = 'container_status/container_status_list.html'


class ContainerStatusListByTrain(ListView):
    model = ContainerStatus
    context_object_name = 'container_status_list'
    template_name = 'container_status/container_status_list.html'

    def get_queryset(self):
        train_id = self.kwargs.get('pk', '')
        return ContainerStatus.objects.filter(train_id=train_id)


def upload_container_documents(request, train_id):
    upload_container_documents_by_train(request.FILES.getlist('container_files'), train_id)
    return HttpResponseRedirect(reverse_lazy('container-status-list-by-train', kwargs={'pk': train_id}))


def upload_waiting_excel(request):
    read_excel_create_waiting_list(request.FILES.get('waiting_list_excel'))
    return HttpResponseRedirect(reverse_lazy('terminal-list'))

