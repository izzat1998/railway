from django.contrib import admin

# Register your models here.
from terminal.models import Terminal, ContainerInTerminal

admin.site.register(Terminal)
admin.site.register(ContainerInTerminal)