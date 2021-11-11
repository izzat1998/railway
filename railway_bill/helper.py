import numpy as np
import pandas as pd
import os
import zipfile
from io import StringIO

from django.http import HttpResponse

from railway.settings import BASE_DIR
from railway_bill.models import RailwayBill, Container
from train.models import Train
from docxtpl import DocxTemplate


def railway_bill_create(create_data):
    create_data = create_data.copy()
    create_data.pop('csrfmiddlewaretoken')
    ready_data = {}
    container = ''
    for key, value in create_data.items():
        if key == 'container':
            container, _ = Container.objects.get_or_create(id=value)
            ready_data[key] = container
        elif key == 'train':
            train, _ = Train.objects.get_or_create(id=value)
            ready_data[key] = train
        else:
            ready_data[key] = value
    file_draft = open(create_railway_document(ready_data, container)[0])
    file_original = open(create_railway_document(ready_data, container)[1])
    ready_data['file'] = file_draft.name.replace('media/', '')
    ready_data['file_original'] = file_original.name.replace('media/', '')
    RailwayBill.objects.create(**ready_data)


def railway_bill_update(update_data, pk, ):
    update_data = update_data.copy()
    update_data.pop('csrfmiddlewaretoken')
    ready_data = {}
    container = ''
    for key, value in update_data.items():
        if key == 'container':
            container, _ = Container.objects.get_or_create(id=int(value))
            ready_data[key] = container.id
        elif key == 'train':
            ready_data[key] = int(value)
        else:
            ready_data[key] = value
    file_draft = open(create_railway_document(ready_data, container)[0])
    file_original = open(create_railway_document(ready_data, container)[1])
    ready_data['file'] = file_draft.name.replace('media/', '')
    ready_data['file_original'] = file_original.name.replace('media/', '')
    RailwayBill.objects.filter(pk=pk).update(**ready_data)


def create_railway_document(ready_data, container):
    ready_data = ready_data.copy()
    try:
        doc_1 = DocxTemplate('static/Order_draft.docx')
        doc_2 = DocxTemplate('static/Order_original.docx')
        ready_data['p'] = str(container.weight_type).split('.')[0]
        ready_data['type'] = container.weight_type_code
        doc_1.render(ready_data)
        doc_2.render(ready_data)
        if isinstance(ready_data['train'], int):
            name = Train.objects.get(id=ready_data['train']).name
            doc_1.save(
                'media/documents/draft/' + name + '_' + container.name + ".docx")
            doc_2.save(
                'media/documents/original/' + name + '_' + container.name + ".docx")
            return [f'media/documents/draft/' + name + '_' + container.name + ".docx",
                    f'media/documents/original/' + name + '_' + container.name + ".docx"]
        else:
            doc_1.save(
                'media/documents/draft/' + ready_data['train'].name + '_' + container.name + ".docx")
            doc_2.save(
                'media/documents/original/' + ready_data['train'].name + '_' + container.name + ".docx")
            return [f'media/documents/draft/' + ready_data['train'].name + '_' + container.name + ".docx",
                    f'media/documents/original/' + ready_data['train'].name + '_' + container.name + ".docx"]
    except FileExistsError:
        raise FileExistsError



def convert_excel_data_to_railway_data(train_id, excel_data):
    df = pd.read_excel(excel_data)
    df = df.replace(np.nan, '', regex=True)
    ready_data = {}
    for index, row in df.iterrows():
        container, created = Container.objects.get_or_create(name=row['НОМЕР КОНТЕЙНЕРА'], weight_type=row['ТИП КНТР'],
                                                             weight_type_code=row['ТИП G1'])
        train, _ = Train.objects.get_or_create(id=train_id)
        if index == 0:
            existed_railway = RailwayBill.objects.filter(train=train)
            if existed_railway.exists():
                existed_railway.delete()
        ready_data['container'] = container
        ready_data['train'] = train
        ready_data['railway_code'] = row['НОМЕР SMGS']
        ready_data['sender'] = row['ОТПРАВИТЕЛЬ']
        ready_data['departure_station'] = row['СТАНЦИЯ ОТПРАВЛЕНИЯ']
        ready_data['sender_statement'] = row['ЗАЯВЛЕНИЯ ОТПРАВИТЕЛЯ']
        ready_data['recipient'] = row['ПОЛУЧАТЕЛЬ']
        ready_data['destination_station'] = row['СТАНЦИЯ НАЗНАЧЕНИЯ']
        ready_data['border_crossing_stations'] = row['ПОГРАНИЧНЫЕ СТАНЦИИ ПЕРЕХОДОВ']
        ready_data['railway_carriage'] = row['ВАГОН']
        ready_data['shipping_name'] = row['НАИМЕНОВАНИЕ ГРУЗА']
        ready_data['container_owner'] = row['КОНТЕЙНЕР СОБСТВЕННОСТИ']
        ready_data['type_of_packaging'] = row['РОД УПАКОВКИ']
        ready_data['number_of_seats'] = row['К-ВО МЕСТ']
        ready_data['net'] = row['НЕТТО']
        ready_data['tara'] = row['ТАРА КОНТЕЙНЕРА']
        ready_data['gross'] = row['БРУТТО']
        ready_data['seals'] = row['ЗНАКИ']
        ready_data['seal_quantity'] = row['К-ВО']
        ready_data['submerged'] = row['ПОГРУЖЕНО']
        ready_data['method_of_determining_mass'] = row['СПОСОБ ОПРЕДЕЛЕНИЯ МАССЫ']
        ready_data['payment_of_legal_fees'] = row['КОДЫ ПО УТИ'] + '\n' + row['КОДЫ ПО КЗХ'] + '\n' + row[
            'КОДЫ ПО КЖД']
        ready_data['carriers'] = row['ПЕРЕВОЗЧИКИ(УЧАСТКИ)']
        ready_data['documents_by_sender'] = row['Документы. приложенные отправителем']
        ready_data['additional_information'] = row[
            'Информация. не предназначенная для перевозчика. № договора  по поставку']
        if row['ТЖ ПЛОМБА'] != '':
            ready_data['custom_seal'] = int(row['ТЖ ПЛОМБА'])
        else:
            ready_data['custom_seal'] = row['ТЖ ПЛОМБА']
        ready_data['inspector_name'] = row['ИМЯ ИНСПЕКТОРА']
        ready_data['date'] = row['Дата']
        pre_files = create_railway_document(ready_data, container)
        file_draft = open(pre_files[0])
        file_original = open(pre_files[1])
        ready_data['file'] = file_draft.name.replace('media/', '')
        ready_data['file_original'] = file_original.name.replace('media/', '')

        RailwayBill.objects.create(**ready_data)
