from django.contrib import admin

# Register your models here.
from container_status.models import ContainerStatus, SealImage, ContainerDocument, WaitingList

admin.site.register(ContainerStatus)
admin.site.register(SealImage)
admin.site.register(ContainerDocument)
admin.site.register(WaitingList)
