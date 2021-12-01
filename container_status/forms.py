from django import forms
from django.forms import inlineformset_factory

from container_status.models import ContainerStatus, SealImage

SealImageFormSet = inlineformset_factory(
    ContainerStatus, SealImage, fields=('image',)
)
