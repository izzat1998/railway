from django.dispatch import receiver
from django.shortcuts import render
from django.db import models
# Create your views here.
from django.urls import reverse_lazy
from django.views import View
from django.views.generic import ListView, DeleteView

from container_status.models import WaitingList
from terminal.models import ContainerInTerminal
from train.models import Terminal, Train


class TerminalList(ListView):
    model = Terminal
    template_name = 'terminal/terminal_list.html'

    def get_context_data(self, **kwargs):
        context = super(TerminalList, self).get_context_data(**kwargs)
        context['containers_in_terminal'] = ContainerInTerminal.objects.all()
        return context


class ContainersByTerminal(ListView):
    model = ContainerInTerminal
    template_name = 'terminal/terminal_list.html'
    context_object_name = 'containers_in_terminal'

    def get_queryset(self):
        terminal_id = self.kwargs.get('pk', '')
        return ContainerInTerminal.objects.filter(terminal_id=terminal_id)

    def get_context_data(self, **kwargs):
        context = super(ContainersByTerminal, self).get_context_data(**kwargs)
        context['terminals'] = Terminal.objects.all()
        return context


class ContainerInTerminalDelete(DeleteView):
    model = ContainerInTerminal
    template_name = 'terminal/container_in_terminal_delete.html'

    def get_success_url(self):
        return reverse_lazy('terminal-list')


@receiver(models.signals.post_delete, sender=ContainerInTerminal)
def delete_file(sender, instance, *args, **kwargs):
    """ Deletes image files on `post_delete` """
    WaitingList.objects.get_or_create(container_id=instance.container.id)
