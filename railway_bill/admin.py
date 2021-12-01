from django.contrib import admin

# Register your models here.

from .models import Container, RailwayBill


class ContainerAdmin(admin.ModelAdmin):
    search_fields = ['name']
    ordering = ['name']


admin.site.register(Container, ContainerAdmin)
admin.site.register(RailwayBill)

# Register your models here.
