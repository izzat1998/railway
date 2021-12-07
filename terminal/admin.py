from django.contrib import admin

# Register your models here.
from terminal.models import Terminal, ContainerInTerminal, ContainerInTerminalSealImage, ContainerInTerminalDocument

admin.site.register(Terminal)
admin.site.register(ContainerInTerminal)
admin.site.register(ContainerInTerminalSealImage)
admin.site.register(ContainerInTerminalDocument)