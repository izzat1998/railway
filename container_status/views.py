from django.http import HttpResponseRedirect
from django.shortcuts import render, redirect

# Create your views here.
from django.urls import reverse_lazy
from django.views.generic import ListView, DeleteView


from container_status.models import ContainerStatus


class ContainerStatusList(ListView):
    model = ContainerStatus
    context_object_name = 'container_status_list'
    template_name = 'container_status/container_status_list.html'


class ContainerStatusDelete(DeleteView):
    model = ContainerStatus
    template_name = 'container_status/container_status_delete.html'

    def get_success_url(self):
        return reverse_lazy('container-status-list')


class ContainerStatusListByTrain(ListView):
    model = ContainerStatus
    context_object_name = 'container_status_list'
    template_name = 'container_status/container_status_list.html'

    def get_queryset(self):
        train_id = self.kwargs.get('pk', '')
        return ContainerStatus.objects.filter(train_id=train_id)



