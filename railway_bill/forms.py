from turtle import width

from django import forms
from django.forms import ChoiceField, ModelChoiceField

from railway_bill.models import RailwayBill, Container
from train.models import Train


class RailwayForm(forms.ModelForm):
    # train = ChoiceField(
    #     choices=[(train.id, train.name) for train in Train.objects.all()])
    # container = ChoiceField(
    #     choices=[(container.id, container.name) for container in Container.objects.all()])
    #

    class Meta:
        model = RailwayBill
        fields = ['railway_code', 'sender', 'departure_station', 'sender_statement', 'recipient', 'destination_station',
                  'border_crossing_stations', 'railway_carriage', 'shipping_name', 'container_owner', 'shipping_type',
                  'container', 'type_of_packaging', 'number_of_seats', 'net', 'tara', 'gross', 'seals', 'submerged',
                  'method_of_determining_mass', 'payment_of_legal_fees', 'carriers', 'documents_by_sender',
                  'additional_information', 'custom_seal', 'train', 'file'
                  ]
        widgets = {
            'railway_code': forms.TextInput(attrs={'class': 'form-control'}),
            'sender': forms.Textarea(attrs={'class': 'form-control', 'rows': 3, 'columns': 2}),
            'departure_station': forms.TextInput(attrs={'class': 'form-control'}),
            'sender_statement': forms.Textarea(attrs={'class': 'form-control', 'rows': 4, 'columns': 2}),
            'recipient': forms.Textarea(attrs={'class': 'form-control', 'rows': 3, 'columns': 2}),
            'destination_station': forms.Textarea(attrs={'class': 'form-control', 'rows': 3, 'columns': 2}),
            'border_crossing_stations': forms.Textarea(attrs={'class': 'form-control', 'rows': 3, 'columns': 2}),
            'railway_carriage': forms.Textarea(attrs={'class': 'form-control', 'rows': 3, 'columns': 2}),
            'shipping_name': forms.Textarea(attrs={'class': 'form-control', 'rows': 3, 'columns': 2}),
            'container_owner': forms.Textarea(attrs={'class': 'form-control', 'rows': 3, 'columns': 2}),
            'shipping_type': forms.Textarea(attrs={'class': 'form-control', 'rows': 3, 'columns': 2}),
            'container': forms.Select(attrs={'class': 'form-control'}),
            'type_of_packaging': forms.TextInput(attrs={'class': 'form-control'}),
            'number_of_seats': forms.TextInput(attrs={'class': 'form-control'}),
            'net': forms.TextInput(attrs={'class': 'form-control'}),
            'tara': forms.TextInput(attrs={'class': 'form-control'}),
            'gross': forms.TextInput(attrs={'class': 'form-control'}),
            'seals': forms.TextInput(attrs={'class': 'form-control'}),
            'submerged': forms.TextInput(attrs={'class': 'form-control'}),
            'method_of_determining_mass': forms.TextInput(attrs={'class': 'form-control'}),
            'payment_of_legal_fees': forms.TextInput(attrs={'class': 'form-control'}),
            'carriers': forms.Textarea(attrs={'class': 'form-control', 'rows': 3, 'columns': 2}),
            'documents_by_sender': forms.TextInput(attrs={'class': 'form-control'}),
            'custom_seal': forms.TextInput(attrs={'class': 'form-control'}),
            'additional_information': forms.TextInput(attrs={'class': 'form-control'}),
            'train': forms.Select(attrs={'class': 'form-control'}),

        }

    def __init__(self, *args, **kwargs):
        super(RailwayForm, self).__init__(*args, **kwargs)
        self.fields['container'] = ModelChoiceField(
            queryset=Container.objects.all())
        self.fields['train'] = ModelChoiceField(
            queryset=Train.objects.all())
