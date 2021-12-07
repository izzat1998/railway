from rest_framework import serializers

from container_status.models import ContainerStatus
from railway_bill.models import Container
from staff.models import Staff
from terminal.models import ContainerInTerminal, Terminal


class ContainerInTerminalSerializerCreate(serializers.Serializer):
    telegram_id = serializers.CharField(max_length=10)
    container_name = serializers.CharField(max_length=200)
    container_type = serializers.CharField(max_length=200)
    terminal_name = serializers.CharField(max_length=10)
    laden = serializers.BooleanField()
    date_of_arrived = serializers.DateField()

    def validate(self, data):
        if not Terminal.objects.filter(name=data['terminal_name']).exists():
            raise serializers.ValidationError("This Terminal doesn`t exist")
        if not Staff.objects.filter(telegram_id=data['telegram_id']).exists():
            raise serializers.ValidationError("This user is not registered")
        return data

    def create(self, validated_data):
        telegram_id = validated_data.pop('telegram_id')
        container_name = validated_data.pop('container_name')
        container_type = validated_data.pop('container_type')
        laden = validated_data.pop('laden')
        terminal_name = validated_data.pop('terminal_name')
        date_of_arrived = validated_data.pop('date_of_arrived')
        staff = Staff.objects.filter(telegram_id=telegram_id)
        container, _ = Container.objects.get_or_create(name=container_name)
        container.weight_type = container_type
        container.save()
        terminal = Terminal.objects.get(name=terminal_name)
        container_in_terminal = ContainerInTerminal.objects.filter(container=container)
        if container_in_terminal.exists():
            container_in_terminal = container_in_terminal.first()
            container_in_terminal.arrived = True
            container_in_terminal.save()
        else:
            container_in_terminal = ContainerInTerminal.objects.create(container=container, terminal=terminal,
                                                                       staff=staff[0], laden=laden,
                                                                       date_of_arrived=date_of_arrived)
        ContainerStatus.objects.filter(container_in_terminal__container=container).update(
            container_in_terminal=container_in_terminal)

        return container_in_terminal
