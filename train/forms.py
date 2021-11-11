from django import forms

from train.models import Train


class TrainForm(forms.ModelForm):
    class Meta:
        model = Train
        fields = ['name', 'type']
        widgets = {
            'name': forms.TextInput(attrs={'class': 'form-control'}),
            'type': forms.Select(attrs={'class': 'form-control'})
        }
