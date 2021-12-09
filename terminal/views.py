from django.dispatch import receiver
from django.http import HttpResponseRedirect
from django.shortcuts import render, redirect
from django.db import models
# Create your views here.
from django.urls import reverse_lazy
from django.views import View
from django.views.generic import ListView, DeleteView

from terminal.helper import upload_container_documents_inner, get_container_in_terminal_data, \
    update_container_in_terminal
from terminal.models import ContainerInTerminal
from train.models import Terminal, Train


class TerminalList(ListView):
    model = Terminal
    template_name = 'terminal/terminal_list.html'

    def get_context_data(self, **kwargs):
        context = super(TerminalList, self).get_context_data(**kwargs)
        context['containers_in_terminal'] = ContainerInTerminal.objects.filter(arrived=True)
        context['containers_in_waiting_list'] = ContainerInTerminal.objects.filter(arrived=False)
        return context


class ContainersByTerminal(ListView):
    model = ContainerInTerminal
    template_name = 'terminal/terminal_list.html'
    context_object_name = 'containers_in_terminal'

    def get_queryset(self):
        terminal_id = self.kwargs.get('pk', '')
        return ContainerInTerminal.objects.filter(terminal_id=terminal_id, arrived=True)

    def get_context_data(self, **kwargs):
        context = super(ContainersByTerminal, self).get_context_data(**kwargs)
        context['terminals'] = Terminal.objects.all()
        return context


class ContainerInTerminalSendWaitingList(View):
    def get(self, request, pk):
        ContainerInTerminal.objects.filter(pk=pk).update(arrived=False)
        return HttpResponseRedirect(reverse_lazy('terminal-list'))


class ContainerInTerminalUpdate(View):
    def get(self, request, pk):
        context = get_container_in_terminal_data(pk)
        return render(request, 'terminal/container_in_terminal_update.html', context=context)

    def post(self, request, pk):
        update_container_in_terminal(request, pk)
        return redirect(reverse_lazy('container-status-list'))


def upload_container_in_terminal_documents(request):
    upload_container_documents_inner(request.FILES.getlist('container_files'))
    return HttpResponseRedirect(reverse_lazy('terminal-list'))
