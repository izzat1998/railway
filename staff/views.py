from django.http import HttpResponseRedirect
from django.shortcuts import render, redirect

# Create your views here.
from django.urls import reverse_lazy
from django.views import View

from container_status.models import ContainerStatus
from staff.models import Client, Staff
from train.models import Train


class ClientData(View):
    def get(self, request):
        container_status = ''
        trains = ''
        if request.user.is_authenticated:
            client = Client.objects.filter(user=request.user)
            staff = Staff.objects.filter(user=request.user)
            if client.exists():
                print(client)
                trains = Train.objects.filter(container_status__clients__in=client).values('name', 'pk').distinct()
                container_status = ContainerStatus.objects.filter(clients__in=client)
                return render(request, 'clients/table_list.html', context={'container_status_list': container_status,
                                                                           'trains_by_client': trains})
            elif staff.exists():
                return HttpResponseRedirect(reverse_lazy('terminal-list'))
        else:

            return render(request, 'clients/table_list.html', context={'container_status_list': container_status,
                                                                       'trains_by_client': trains})


class ClientDataByTrain(View):
    def get(self, request, pk):
        container_status = ''
        trains = []
        if request.user.is_authenticated:
            client = Client.objects.filter(user=request.user)
            if client.exists():
                trains = Train.objects.filter(container_status__clients__in=client).values('name', 'pk').distinct()
                container_status = ContainerStatus.objects.filter(clients__in=client, train_id=pk)
        print(trains)
        return render(request, 'clients/table_list.html', context={'container_status_list': container_status,
                                                                   'trains_by_client': trains})
