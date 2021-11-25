from django.db import models


# Create your models here.


class Terminal(models.Model):
    name = models.CharField(max_length=50)

    def __str__(self):
        return self.name


class ContainerInTerminal(models.Model):
    container = models.OneToOneField('railway_bill.Container', related_name='container_in_terminal', on_delete=models.CASCADE,null=True)
    terminal = models.ForeignKey(Terminal, related_name='container_list_in_terminal', on_delete=models.CASCADE,)

    def __str__(self):
        return self.container.name
