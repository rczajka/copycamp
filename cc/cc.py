# run with some DISPLAY set

import os
from wheezy.http import HTTPResponse
from wheezy.http import WSGIApplication
from wheezy.routing import url
from wheezy.web.handlers import MethodHandler
from wheezy.web.middleware import bootstrap_defaults
from wheezy.web.middleware import path_routing_middleware_factory
from wheezy.http.response import redirect
from wheezy.http import json_response
from time import time
from collections import defaultdict


PREZENTACJE = '/home/copycamp/prezentacje'


state = defaultdict(dict)
state['timer']['set'] = 600


def get_state(request):
    if 'tag' in request.query:
        data = state[request.query['tag'][0]]
    else:
        data = state
    state['timer']['time'] = time()
    return json_response(data)


def timer_set(request):
    os.system('/home/copycamp/bin/stop-recording.sh')

    seconds = 0
    try:
        minutes = request.form.get('set')[0]
        parts = minutes.split(':')
        if len(parts) == 1:
            seconds = 60 * int(parts[0])
        else:
            for part in parts:
                seconds = seconds * 60 + int(part)
    except ValueError:
        seconds = 600

    state['timer'] = {'set': seconds}

    return redirect('/')


def timer_start(request):
    timer = state['timer']
    if not 'start' in timer:
        if 'pause' in timer:
            del timer['pause']
        else:
            os.system('/home/copycamp/bin/record.sh')
        timer['start'] = time()

    return redirect('/')


def timer_pause(request):
    timer = state['timer']
    if 'start' in timer:
        timer['pause'] = True
        timer['set'] -= time() - timer['start']
        del timer['start']

    return redirect('/')


def firefox_show(request):
    os.system('/home/copycamp/bin/to-firefox.sh')
    state['firefox']['show'] = True
    return redirect('/')


def firefox_hide(request):
    os.system('/home/copycamp/bin/to-pres.sh')
    state['firefox']['show'] = False
    return redirect('/')


def firefox_restart(request):
    os.system('/home/copycamp/bin/firefox.sh')
    return redirect('/')

def lvds(request):
    os.system('/home/copycamp/bin/lvds.sh')
    return redirect('/')

def vga(request):
    os.system('/home/copycamp/bin/vga.sh')
    return redirect('/')


def pdf(path):
    os.system('/home/copycamp/bin/pdf.sh "{}"'.format(path))

def pres(path):
    os.system('/home/copycamp/bin/prezentacja.sh "{}"'.format(path))

def movie(path):
    os.system('/home/copycamp/bin/movie.sh "{}"'.format(path))

def shell(path):
    os.system("bash '{}'".format(path));

exts = {
    'pdf': pdf,
    'odp': pres,
    'ppt': pres,
    'pptx': pres,
    'mov': movie,
    'avi': movie,
    'mpg': movie,
    'flv': movie,
    'mpeg': movie,
    'ogv': movie,
    'm4v': movie,
    'mp4': movie,
    'sh': shell,
}

def getext(path):
    parts = path.rsplit('.', 1)
    if len(parts) == 2 and parts[1] in exts:
        return exts[parts[1]]
    else:
        return None


def update_tree(directory, tree, level=0):
    try:
        fnames = sorted(os.listdir(directory))
    except OSError:
        tree.append((level, 'Missing dir: ' + directory, 'o', ''))
        return

    for fname in fnames:
        if fname.startswith('.'):
            continue
        path = os.path.join(directory, fname)
        if os.path.isdir(path):
            type_ = 'd'
        else:
            ext = getext(fname)
            if ext is None:
                type_ = 'o'
            else:
                type_ = 'k'
        tree.append((level, fname, type_, path))
        if type_ == 'd':
            update_tree(path, tree, level + 1)


def presentations_refresh(request):
    tree = []
    update_tree(PREZENTACJE, tree)
    return json_response(tree, encoding='utf-8')


def presentations_run(request):
    path = ",".join(request.form.get('path'))
    ext = getext(path)
    if ext is not None:
        ext(path)
    return redirect('/')


all_urls = [
    url('state', get_state),
    url('timer-set', timer_set),
    url('timer-start', timer_start),
    url('timer-pause', timer_pause),
    url('firefox-show', firefox_show),
    url('firefox-hide', firefox_hide),
    url('firefox-restart', firefox_restart),
    url('presentations-refresh', presentations_refresh),
    url('presentations-run', presentations_run),
    url('lvds', lvds),
    url('vga', vga),

]


options = {}
main = WSGIApplication(
    middleware=[
        bootstrap_defaults(url_mapping=all_urls),
        path_routing_middleware_factory
    ],
    options=options
)


if __name__ == '__main__':
    from wsgiref.simple_server import make_server
    try:
        print('Visit http://localhost:8080/')
        make_server('0.0.0.0', 8080, main).serve_forever()
    except KeyboardInterrupt:
        pass
    print('\nThanks!')
