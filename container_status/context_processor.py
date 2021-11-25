from container_status.models import ContainerStatus, WaitingList


def access_container_status_list(request):
    """
      The context processor must return a dictionary.
    """
    container_list = WaitingList.objects.all()  # query the latest banner image
    return {'waiting_containers': container_list}
