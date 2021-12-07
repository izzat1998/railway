from terminal.models import ContainerInTerminal


def access_waiting_containers_list(request):
    """
      The context processor must return a dictionary.
    """
    container_list = ContainerInTerminal.objects.filter(arrived=False)  # query the latest banner image
    return {'waiting_containers': container_list}
