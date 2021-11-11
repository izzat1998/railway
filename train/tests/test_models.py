from django.test import Client, TestCase

from django.urls import reverse

from train.models import Train


class TrainTestView(TestCase):

    def setUp(self):
        self.train = Train.objects.create(
            name='10000',
            type="export",
        )

    def test_train_update(self):
        self.train.name = 'Izzat'
        self.train.type = 'export'
        self.train.save()
        self.assertEqual(f'{self.train.name}', 'Izzat')
        self.assertEqual(f'{self.train.type}', 'export')
