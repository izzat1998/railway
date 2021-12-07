import numpy as np
import pandas as pd
from django.core.files.storage import FileSystemStorage


from railway_bill.models import Container


def handle_uploaded_file(f, train_id):
    folder = 'media/documents/container/'
    try:

        fs = FileSystemStorage(location=folder)  # defaults to   MEDIA_ROOT
        filename = fs.save(str(train_id) + '_' + f.name, f)
        return True, str(train_id) + '_' + f.name
    except:
        Exception



