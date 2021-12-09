from django.db import models

# Create your models here.
from django.db.models.signals import post_delete, pre_delete, pre_save
from django.dispatch import receiver

from railway_bill.models import Container
from terminal.models import ContainerInTerminal
from train.models import Train


class ContainerStatus(models.Model):
    train = models.ForeignKey(Train, related_name='container_status', on_delete=models.CASCADE)
    container_in_terminal = models.OneToOneField(ContainerInTerminal, related_name='container_statuses',
                                                 on_delete=models.CASCADE, blank=True, null=True)

    def __str__(self):
        return self.container_in_terminal.container.name
