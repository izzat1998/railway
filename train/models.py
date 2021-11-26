from django.db import models

# Create your models here.
from django.urls import reverse

from terminal.models import Terminal


class Train(models.Model):
    choices = (
        ('export', 'export'),
        ('import', 'import'))
    name = models.CharField(max_length=100)
    type = models.CharField(max_length=100, choices=choices)
    terminal = models.ForeignKey(Terminal, on_delete=models.SET_NULL, related_name='trains', null=True)

    def __str__(self):
        return self.name

    def get_absolute_url(self):  # new
        return reverse('train-update', args=[str(self.id)])
