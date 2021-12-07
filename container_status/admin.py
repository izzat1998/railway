from django.contrib import admin

# Register your models here.
from container_status.models import ContainerStatus
from staff.models import Client

admin.site.register(ContainerStatus)
admin.site.register(Client)
