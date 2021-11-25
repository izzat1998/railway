from train.models import Terminal


def access_terminals(request):
    """
      The context processor must return a dictionary.
    """
    terminals = Terminal.objects.all()  # query the latest banner image
    return {'terminals': terminals}
