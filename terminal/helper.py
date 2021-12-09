from terminal.models import ContainerInTerminal, ContainerInTerminalDocument, ContainerInTerminalSealImage


def upload_container_documents_inner(documents):
    for document in documents:
        containers_in_terminal = ContainerInTerminal.objects.filter(container__name=str(document.name)[:11])
        if containers_in_terminal.exists():
            ContainerInTerminalDocument.objects.create(document=document,
                                                       container_in_terminal=containers_in_terminal.first())


def get_container_in_terminal_data(pk):
    context = {}
    container = ContainerInTerminal.objects.get(id=pk)
    context['container_in_terminal'] = container
    context['terminal'] = container.terminal
    context['arrived'] = container.arrived
    context['laden'] = container.laden
    context['seal_images'] = ContainerInTerminalSealImage.objects.filter(container_in_terminal=container)
    context['documents'] = ContainerInTerminalDocument.objects.filter(container_in_terminal=container)
    return context


def update_container_in_terminal(request, pk):
    laden = request.POST.get('laden', False)
    arrived = request.POST.get('arrived', False)
    terminal_id = request.POST.get('terminal', False)
    deleted_files_id = request.POST.get('deleted_files_id')
    deleted_images_id = request.POST.get('deleted_images_id')
    new_seal_images = request.FILES.getlist('new_seal_images')
    new_files = request.FILES.getlist('new_files', False)
    if new_files:
        for new_file in new_files:
            ContainerInTerminalDocument.objects.create(document=new_file, container_in_terminal_id=pk)
    if new_seal_images:
        for new_seal_image in new_seal_images:
            ContainerInTerminalSealImage.objects.create(image=new_seal_image, container_in_terminal_id=pk)
    if deleted_files_id != '':
        deleted_files_id = str(deleted_files_id).replace("document", ",")
        deleted_files_id = deleted_files_id[1:].split(',')
        for deleted_file_id in deleted_files_id:
            ContainerInTerminalDocument.objects.get(id=deleted_file_id).delete()
    if deleted_images_id != '':
        deleted_images_id = str(deleted_images_id).replace("image", ",")
        deleted_images_id = deleted_images_id[1:].split(',')
        for delete_image_id in deleted_images_id:
            ContainerInTerminalSealImage.objects.get(id=delete_image_id).delete()
    if laden == 'on':
        laden = True
    if arrived == 'on':
        arrived = True
    ContainerInTerminal.objects.filter(id=pk).update(terminal_id=terminal_id, laden=laden, arrived=arrived)
