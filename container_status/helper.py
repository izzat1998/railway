import numpy as np
import pandas as pd
from django.core.files.storage import FileSystemStorage

from container_status.models import ContainerStatus, ContainerDocument, WaitingList
from railway_bill.models import Container


def upload_container_documents_by_train(documents, train_id):
    folder = 'documents/container/'
    containers_status = ContainerStatus.objects.select_related('cargo_container').filter(train_id=train_id)
    print(containers_status)
    for document in documents:
        for container_status in containers_status:
            print(container_status.cargo_container.name, document.name)
            if container_status.cargo_container.name in document.name:
                status, saved_document_name = handle_uploaded_file(document, train_id)
                if status:
                    ContainerDocument.objects.create(document=(folder + saved_document_name),
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
        WaitingList.objects.get_or_create(container=container)
