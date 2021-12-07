from django.db import models

# Create your models here.


from staff.models import Staff


class Terminal(models.Model):
    name = models.CharField(max_length=50)

    def __str__(self):
        return self.name


class ContainerInTerminal(models.Model):
    container = models.OneToOneField('railway_bill.Container', related_name='container_in_terminal',
                                     on_delete=models.CASCADE, null=True)
    terminal = models.ForeignKey(Terminal, related_name='container_list_in_terminal', on_delete=models.CASCADE, )
    staff = models.ForeignKey(Staff, related_name='container_list_in_terminal', on_delete=models.CASCADE)
    laden = models.BooleanField(default=False)
    arrived = models.BooleanField(default=False)
    date_of_arrived = models.DateField(blank=True, null=True)

    def __str__(self):
        return self.container.name


class ContainerInTerminalDocument(models.Model):
    document = models.FileField(upload_to='documents/containers/')
    container_in_terminal = models.ForeignKey(ContainerInTerminal, on_delete=models.CASCADE,
                                              related_name='container_documents', null=True)

    def __str__(self):
        return self.container_in_terminal.container.name


class ContainerInTerminalSealImage(models.Model):
    image = models.ImageField(upload_to='seal_images/')
    container_in_terminal = models.ForeignKey(ContainerInTerminal, related_name='seal_images', on_delete=models.CASCADE,
                                              null=True)
