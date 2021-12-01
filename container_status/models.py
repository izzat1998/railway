from django.db import models

# Create your models here.
from railway_bill.models import Container
from train.models import Train


class ContainerDocument(models.Model):
    document = models.FileField(upload_to='documents/containers/')
    container_status = models.ForeignKey('ContainerStatus', on_delete=models.CASCADE,
                                         related_name='container_documents', null=True)

    def __str__(self):
        return self.container_status.cargo_container.name


class SealImage(models.Model):
    image = models.ImageField(upload_to='seal_images/')
    container_status = models.ForeignKey('ContainerStatus', related_name='seal_images', on_delete=models.CASCADE,
                                         null=True)

    def __str__(self):
        return self.container_status.cargo_container.name


class ContainerStatus(models.Model):
    train = models.ForeignKey(Train, related_name='container_status', on_delete=models.CASCADE)
    cargo_container = models.ForeignKey(Container, related_name='container_statuses', on_delete=models.CASCADE)
    arrived = models.BooleanField(default=False)
    laden = models.BooleanField(default=False)

    def __str__(self):
        return self.cargo_container.name


class WaitingList(models.Model):
    container = models.OneToOneField('railway_bill.Container', related_name='container_in_waiting_list',
                                     on_delete=models.CASCADE, null=True)

    def __str__(self):
        return self.container.name
