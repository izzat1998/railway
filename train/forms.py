from django import forms
from django.forms import ModelChoiceField

from terminal.models import Terminal
from train.models import Train


class TrainForm(forms.ModelForm):
    class Meta:
        model = Train
        fields = ['name', 'type', 'terminal']
        widgets = {
            'name': forms.TextInput(attrs={'class': 'form-control'}),
            'type': forms.Select(attrs={'class': 'form-control'}),
            'terminal':forms.Select(attrs={'class': 'form-control'}),
        }

        def __init__(self, *args, **kwargs):
            super(TrainForm, self).__init__(*args, **kwargs)
            self.fields['terminal'] = ModelChoiceField(
                queryset=Terminal.objects.all())
