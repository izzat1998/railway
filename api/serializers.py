from rest_framework import serializers

from container_status.models import WaitingList, ContainerStatus
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
        containers = Container.objects.filter(name=data['container_name'])
        if containers.exists():
            if ContainerInTerminal.objects.filter(container=containers[0]).exists():
                raise serializers.ValidationError("This Container is already in Terminal")
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
        if WaitingList.objects.filter(container=container).exists():
            WaitingList.objects.get(container=container).delete()
        ContainerStatus.objects.filter(cargo_container=container).update(arrived=True, laden=laden)

        terminal = Terminal.objects.get(name=terminal_name)
        container_in_terminal = ContainerInTerminal.objects.get_or_create(container=container, terminal=terminal,
                                                                          staff=staff[0],
                                                                          date_of_arrived=date_of_arrived)

        return container_in_terminal
