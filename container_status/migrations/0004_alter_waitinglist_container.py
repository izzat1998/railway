# Generated by Django 3.2.8 on 2021-11-24 10:58

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('railway_bill', '0018_auto_20211123_1206'),
        ('container_status', '0003_auto_20211124_1410'),
    ]

    operations = [
        migrations.AlterField(
            model_name='waitinglist',
            name='container',
            field=models.OneToOneField(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='container_in_waiting_list', to='railway_bill.container'),
        ),
    ]
