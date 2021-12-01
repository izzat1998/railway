import numpy as np
import pandas as pd
from django.core.files.storage import FileSystemStorage

from container_status.models import ContainerStatus, ContainerDocument, WaitingList, SealImage
from railway_bill.models import Container
from train.models import Train


def upload_container_documents_by_train(documents, train_id):
    folder = 'documents/container/'
    containers_status = ContainerStatus.objects.select_related('cargo_container').filter(train_id=train_id)
    for document in documents:
        for container_status in containers_status:
            print(container_status.cargo_container.name, document.name)
            if container_status.cargo_container.name in document.name:
                ContainerDocument.objects.create(document=document,
                                                 container_status=container_status)



def handle_uploaded_file(f, train_id):
    folder = 'media/documents/container/'
    try:

        fs = FileSystemStorage(location=folder)  # defaults to   MEDIA_ROOT
        filename = fs.save(str(train_id) + '_' + f.name, f)
        return True, str(train_id) + '_' + f.name
    except:
        Exception


def read_excel_create_waiting_list(excel_data):
    df = pd.read_excel(excel_data)
    df = df.replace(np.nan, '', regex=True)
    ready_data = {}
    for index, row in df.iterrows():
        container, _ = Container.objects.get_or_create(name=row['CONTAINER'], weight_type=row['TYPE'])
        print(container)
        WaitingList.objects.get_or_create(container=container)


def get_container_status_data(pk):
    context = {}
    container = ContainerStatus.objects.get(pk=pk)
    context['container_status'] = container
    context['arrived'] = container.arrived
    context['current_train'] = Train.objects.get(container_status=container)
    context['seal_images'] = SealImage.objects.filter(container_status=container)
    context['documents'] = ContainerDocument.objects.filter(container_status=container)
    return context


def upload_container_status(request, pk):
    arrived = request.POST.get('arrived', False)
    train_id = request.POST.get('train', False)
    deleted_files_id = request.POST.get('deleted_files_id')
    deleted_images_id = request.POST.get('deleted_images_id')
    new_seal_images = request.FILES.getlist('new_seal_images')
    new_files = request.FILES.getlist('new_files', False)
    if new_files:
        for new_file in new_files:
            ContainerDocument.objects.create(document=new_file, container_status_id=pk)
    if new_seal_images:
        for new_seal_image in new_seal_images:
            SealImage.objects.create(image=new_seal_image, container_status_id=pk)
    if deleted_files_id != '':
        deleted_files_id = str(deleted_files_id).replace("document", ",")
        deleted_files_id = deleted_files_id[1:].split(',')
        for deleted_file_id in deleted_files_id:
            ContainerDocument.objects.get(id=deleted_file_id).delete()
    if deleted_images_id != '':
        deleted_images_id = str(deleted_images_id).replace("image", ",")
        deleted_images_id = deleted_images_id[1:].split(',')
        for delete_image_id in deleted_images_id:
            print(delete_image_id)
            SealImage.objects.get(id=delete_image_id).delete()
    if arrived == 'on':
        arrived = True
    ContainerStatus.objects.filter(id=pk).update(train_id=train_id, arrived=arrived)
