from django.test import Client, TestCase

from django.urls import reverse

from train.models import Train


class TrainTestView(TestCase):

    def setUp(self):
        self.train = Train.objects.create(
            name='10000',
            type="export",
        )

    def test_train_content(self):
        self.assertEqual(f'{self.train.name}', '10000')
        self.assertEqual(f'{self.train.type}', 'export')

    def test_train_list_view_content(self):
        response = self.client.get(reverse('train-list'))
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, 'Train number')
        self.assertTemplateUsed(response, 'train/train_table.html')

    def test_train_update_view_content(self):
        response = self.client.get(self.train.get_absolute_url())
        no_response = self.client.get('/train/12345/')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(no_response.status_code, 404)
        self.assertContains(response, 'update')
        self.assertTemplateUsed(response, 'train/train_update.html')
    