from django.urls import reverse_lazy

from django.views.generic import ListView, CreateView, UpdateView, DeleteView, TemplateView

from train.forms import TrainForm

from train.models import Train


class TrainList(ListView):
    model = Train
    context_object_name = 'trains'
    template_name = 'train/train_table.html'
    ordering = '-id'


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








class TrainsByTerminal(ListView):
    model = Train
    context_object_name = 'trains'
    template_name = 'train/train_table.html'

    def get_queryset(self):
        terminal_id = self.kwargs.get('pk', '')
        return Train.objects.filter(terminal_id=terminal_id)


class TrainCalendar(TemplateView):
    template_name = 'calendar_train.html'
