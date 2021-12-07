from terminal.models import ContainerInTerminal
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
    data = {}
    terminal_data = []
    for terminal in terminals:
        data['count'] = ContainerInTerminal.objects.filter(terminal=terminal, arrived=True).count()
        data['terminal'] = terminal
        terminal_data.append(data)
        data = {}
    return {'terminal_data': terminal_data,
            'terminals':terminals}
