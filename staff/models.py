from django.contrib.auth.models import User
from django.db import models


# Create your models here.


class Staff(models.Model):
    levels = (

        ('level 1', 'level 1'),
        ('level 2', 'level 2'),
    )
    user = models.OneToOneField(User, related_name='staff', on_delete=models.CASCADE)
    role = models.CharField(max_length=40, choices=levels)
    telegram_id = models.CharField(max_length=20, blank=True, null=True)

    def __str__(self):
        return self.user.username


class Client(models.Model):
    user = models.OneToOneField(User, related_name='client', on_delete=models.CASCADE)
    phone_number = models.CharField(max_length=20, blank=True, null=True)
    containers = models.ManyToManyField('container_status.ContainerStatus', related_name='clients')

    def __str__(self):
        return self.user.username
