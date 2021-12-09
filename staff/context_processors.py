from staff.models import Client


def access_client_list(request):
    client_list = Client.objects.all()
    return {'clients': client_list}
