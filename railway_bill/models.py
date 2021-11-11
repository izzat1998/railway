import blank
from django.db import models

# Create your models here.
from django.db.models.signals import post_delete
from django.dispatch import receiver

from train.models import Train


class Container(models.Model):
    weight_type_choices = (
        ('20', '20'),
        ('40', '40'),
        ('45', '45'),
    )
    weight_type_code_choices = (
        ('22G1', '22G1'),
        ('42G1', '45G1'),
        ('45G1', '45G1'),
        ('L5G1', 'L5G1'),
    )
    name = models.CharField(max_length=100)
    weight_type = models.CharField(max_length=20, choices=weight_type_choices)
    weight_type_code = models.CharField(max_length=20, choices=weight_type_code_choices)

    def __str__(self):
        return self.name


class RailwayBill(models.Model):
    railway_code = models.CharField(max_length=100, blank=True)
    sender = models.TextField(blank=True)
    departure_station = models.CharField(max_length=255, blank=True)
    sender_statement = models.TextField(blank=True)
    recipient = models.TextField(blank=True)
    destination_station = models.TextField(blank=True)
    border_crossing_stations = models.TextField(blank=True)
    railway_carriage = models.TextField(blank=True)
    shipping_name = models.TextField(blank=True)
    container_owner = models.TextField(blank=True)
    shipping_type = models.CharField(max_length=100, blank=True)
    container = models.ForeignKey(Container, related_name='containers', on_delete=models.CASCADE)
    type_of_packaging = models.CharField(max_length=100)
    number_of_seats = models.IntegerField()
    net = models.CharField(max_length=50, blank=True)
    tara = models.CharField(max_length=50, blank=True)
    gross = models.CharField(max_length=50, blank=True)
    seals = models.TextField(blank=True)
    seal_quantity = models.IntegerField(default=0)
    submerged = models.CharField(max_length=100, blank=True)
    method_of_determining_mass = models.CharField(max_length=100, blank=True)
    payment_of_legal_fees = models.TextField(blank=True)
    carriers = models.TextField(blank=True)
    documents_by_sender = models.TextField(blank=True)
    additional_information = models.TextField(blank=True)
    custom_seal = models.CharField(max_length=100, blank=True)
    train = models.ForeignKey(Train, related_name='railway_bills', on_delete=models.CASCADE)
    inspector_name = models.CharField(max_length=50, blank=True)
    date = models.CharField(max_length=50, blank=True)
    file = models.FileField(upload_to='documents/draft/', blank=True)
    file_original = models.FileField(upload_to='documents/original/', blank=True)

    def __str__(self):
        return self.container.name


@receiver(post_delete, sender=RailwayBill)
def post_save_image(sender, instance, *args, **kwargs):
    """ Clean Old File file """
    try:
        instance.file.delete(save=False)
        instance.file_original.delete(save=False)
    except:
        pass
