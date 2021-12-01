from django.http import HttpResponseRedirect
from django.shortcuts import render, redirect

# Create your views here.
from django.urls import reverse_lazy, reverse
from django.views import View
from django.views.generic import ListView, UpdateView, DeleteView

from container_status.forms import SealImageFormSet
from container_status.helper import upload_container_documents_by_train, read_excel_create_waiting_list, \
    get_container_status_data, upload_container_status
from container_status.models import ContainerStatus
from railway_bill.helper import convert_excel_data_to_railway_data


class ContainerStatusList(ListView):
    model = ContainerStatus
    context_object_name = 'container_status_list'
    template_name = 'container_status/container_status_list.html'


class ContainerStatusUpdate(View):
    def get(self, request, pk):
        context = get_container_status_data(pk)
        return render(request, 'container_status/container_status_update.html', context=context)

    def post(self, request, pk):
        upload_container_status(request, pk)
        return redirect(reverse_lazy('container-status-update', kwargs={'pk': pk}))


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


def upload_container_documents(request, train_id):
    upload_container_documents_by_train(request.FILES.getlist('container_files'), train_id)
    return HttpResponseRedirect(reverse_lazy('container-status-list-by-train', kwargs={'pk': train_id}))


def upload_waiting_excel(request):
    read_excel_create_waiting_list(request.FILES.get('waiting_list_excel'))
    return HttpResponseRedirect(reverse_lazy('terminal-list'))
