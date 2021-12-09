from django.http import HttpResponseRedirect
from django.shortcuts import render, redirect

# Create your views here.
from django.urls import reverse_lazy
from django.views import View
from django.views.generic import ListView, DeleteView

from container_status.models import ContainerStatus
from staff.models import Client


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


class ConnectContainerToClient(View):
    def post(self, request):
        clients = Client.objects.all()
        checked_clients_name = []
        container_status_id = request.POST.get('container_status_id', False)
        for client in clients:
            if request.POST.get(client.user.username, False):
                checked_clients_name.append(request.POST.get(client.user.username, False))
        container_status = ContainerStatus.objects.get(id=container_status_id)
        for checked_client_name in checked_clients_name:
            container_status.clients.add(clients.get(user__username=checked_client_name))
        return redirect('container-status-list')
