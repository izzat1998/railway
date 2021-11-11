import os
import zipfile
from pyexpat import model
from time import sleep

from django.http import HttpResponseRedirect, HttpResponse
from django.urls import reverse_lazy
from django.views.generic import ListView, CreateView, UpdateView, FormView, DetailView, DeleteView

from railway_bill.helper import railway_bill_update, railway_bill_create
from railway_bill.forms import RailwayForm
from railway_bill.models import RailwayBill
from train.models import Train


class RailwayBillList(ListView):
    model = RailwayBill
    context_object_name = 'railway_bills'
    template_name = 'railway_bill/railway_table.html'


class RailwayBillListbyTrain(ListView):
    model = RailwayBill
    context_object_name = 'railway_bills'
    template_name = 'railway_bill/railway_table.html'

    def get_queryset(self):
        train_id = self.kwargs.get('pk', '')
        return RailwayBill.objects.filter(train_id=train_id)


class RailwayBillCreate(CreateView):
    model = RailwayBill
    form_class = RailwayForm
    template_name = 'railway_bill/railway_create.html'
    success_url = reverse_lazy('railway-bill-list')

    def post(self, request, *args, **kwargs):
        railway_bill_create(request.POST)
        return HttpResponseRedirect(reverse_lazy('railway-bill-list'))


class RailwayBillUpdate(UpdateView):
    model = RailwayBill
    form_class = RailwayForm
    template_name = 'railway_bill/railway_update.html'

    def post(self, request, *args, **kwargs):
        pk = railway_bill_update(request.POST, kwargs['pk'])
        return HttpResponseRedirect(reverse_lazy('railway-bill-update', kwargs={'pk': pk}))


class RailwayBillDelete(DeleteView):
    model = RailwayBill
    template_name = 'railway_bill/railway_delete.html'

    def get_success_url(self):
        return reverse_lazy('railway-bill-list-by-train', kwargs={'pk': self.kwargs['train_id']})


def download_zip(request, train_id):
    train = Train.objects.prefetch_related('railway_bills').get(id=train_id)
    railway_files = []
    for railway in train.railway_bills.all():
        railway_files.append('media/' + str(railway.file_original))
        railway_files.append('media/' + str(railway.file))
    response = HttpResponse(content_type='application/zip')
    zip_file = zipfile.ZipFile(response, 'w')
    for filename in railway_files:
        zip_file.write(filename)
    response['Content-Disposition'] = 'attachment; filename={}'.format(train.name + '.zip')
    return response
