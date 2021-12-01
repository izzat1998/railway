from train.models import Terminal, Train


def access_trains(request):
    """
      The context processor must return a dictionary.
    """
    trains = Train.objects.all()  # query the latest banner image
    return {'trains': trains}


def access_terminals(request):
    """
      The context processor must return a dictionary.
    """
    terminals = Terminal.objects.all()  # query the latest banner image
    return {'terminals': terminals}
