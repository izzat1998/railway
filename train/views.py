from pyexpat import model

from django.shortcuts import render, redirect

from django.urls import reverse_lazy
from django.views import View
from django.views.generic import ListView, CreateView, UpdateView, DeleteView, TemplateView

from railway_bill.helper import convert_excel_data_to_railway_data
from train.forms import TrainForm

from train.models import Train


class TrainList(ListView):
    model = Train
    context_object_name = 'trains'
    template_name = 'train/train_table.html'


class TrainCreate(CreateView):
    model = Train
    form_class = TrainForm
    template_name = 'train/train_create.html'
    success_url = reverse_lazy('train-list')


class TrainUpdate(UpdateView):
    model = Train
    form_class = TrainForm
    template_name = 'train/train_update.html'
    success_url = reverse_lazy('train-list')


class TrainDelete(DeleteView):
    model = Train
    template_name = 'train/train_delete.html'
    success_url = reverse_lazy('train-list')


class SMGSUpload(View):
    def get(self, request, pk):
        return render(request, 'railway_bill/smgs_pre_upload.html', context={'pk': pk})

    def post(self, request):
        train_id = request.POST.get('train_id')
        excel_file = request.FILES['excel']

        convert_excel_data_to_railway_data(train_id, excel_file)
        return redirect(reverse_lazy('railway-bill-list-by-train', kwargs={'pk': train_id}))


class ContainerStatusUpload(View):
    def get(self, request, pk):
        return render(request, 'container_status/container_status_upload.html', context={'pk': pk})

    def post(self, request):
        train_id = request.POST.get('train_id')
        excel_file = request.FILES['excel']

        convert_excel_data_to_railway_data(train_id, excel_file)
        return redirect(reverse_lazy('railway-bill-list-by-train', kwargs={'pk': train_id}))


class TrainsByTerminal(ListView):
    model = Train
    context_object_name = 'trains'
    template_name = 'train/train_table.html'

    def get_queryset(self):
        terminal_id = self.kwargs.get('pk', '')
        return Train.objects.filter(terminal_id=terminal_id)


class TrainCalendar(TemplateView):
    template_name = 'calendar_train.html'
