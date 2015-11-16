import os, glob, re, yaml
from subprocess import call

TARGET = 'README.md'

TAGS = {
    '.applescript': ['(*','*)'],
    '.sh': ['# '],
    '.py': ['# ']
}
APPS = {
    'Alfred': 'http://alfredapp.com',
    'TextExpander': 'https://smilesoftware.com/TextExpander/index.html',
    'Airmail 2': 'http://airmailapp.com'
}
COMPILER = {
    '.applescript': 'osacompile -x -o %s.scpt %s'
}

def parseBlockComment(file, tagOpen, tagClose):
    yml = ''
    f = open(file, 'r')
    try:
        if f.readline().startswith(tagOpen):
            for line in f:
                if line.startswith(tagClose):
                    break;
                yml += line
    finally:
        f.close();
    return yml


def parseLineComment(file, tag):
    yml = ''
    f = open(file, 'r')
    try:
        line = f.readline()
        if line.startswith(tag):
            yml += line[len(tag):]
            for line in f:
                if not line.startswith(tag):
                    break;
                yml += line[len(tag):]
    finally:
        f.close();
    return yml


_IDS = []
def makeId(label):
    _id = re.sub(r'\s+', '-', label.lower())
    _id = re.sub(r'\.', '', _id)

    __id = _id
    i = 1
    while _id in _IDS:
        _id = '%s-%s' % (__id, i)
        i += 1
    _IDS.append(_id)
    return _id

Y = {}
IDS = {}
files = glob.glob('**/*.*')
for file in files:
    name, ext = os.path.splitext(file)

    if ext in TAGS:
        yml = ''
        if len(TAGS[ext]) == 2:
            yml = parseBlockComment(file, TAGS[ext][0], TAGS[ext][1])
        else:
            yml = parseLineComment(file, TAGS[ext][0])

        if not yml == '':
            try:
                yml = yaml.load(yml)
                if 'name' in yml and 'description' in yml:
                    Y[file] = yml
                    IDS[file] = makeId(yml['name'])
            except:
                pass

T = open(TARGET, 'w')

INDEX = {}

# Generate header
header = open('_README.md').read();
T.write(header);
T.write('\n\n')
print('\x1b[0;32m>\x1b[0m Added headers from \x1b[0;35m_README.md\x1b[0m to documentation')

# Generate TOC
T.write('## Table of contents\n\n')
T.write('1. [Scripts](#scripts)\n')
for file, yml in iter(sorted(Y.items())):
    T.write('\t- [%s](#%s)\n' % (yml['name'], IDS[file]))
T.write('1. [App Index](#app-index)\n')

# Generate docs
T.write('\n## Scripts\n\n')
for file, yml in iter(sorted(Y.items())):
    def make_link(app):
        if app in APPS:
            return '[%s](%s)' % (app, APPS[app])
        else:
            return app
    apps = [a.strip() for a in yml['apps'].split(',')]
    for app in apps:
        if not app in INDEX:
            INDEX[app] = [file]
        else:
            INDEX[app].append(file)
    apps = map(make_link, apps)

    T.write('### %s\n' % yml['name'])
    T.write('- File: [_%s_](./%s)\n' % (file, file))
    T.write('- Apps: %s\n\n' % ', '.join(apps))
    T.write('> %s\n\n' % yml['description'])

    if 'parameters' in yml and not yml['parameters'] == None and len(yml['parameters']) > 0:
        T.write('\n- Parameters:\n\n')
        for param, descr in yml['parameters'].items():
            # T.write('- **%s**  \n\t%s\n' % (param, descr))
            T.write('\t- **%s**: %s\n' % (param, descr))

    T.write('\n\n')

    print('\x1b[0;32m>\x1b[0m Added \x1b[0;35m%s\x1b[0m to documentation' % file)

    name, ext = os.path.splitext(file)
    if 'compile' in yml and yml['compile'] == True and ext in COMPILER:
        call(COMPILER[ext] % (name, file), shell=True)
        print('\x1b[0;32m->\x1b[0m Created binary for \x1b[0;35m%s\x1b[0m' % file)


# Generate index
T.write('\n## App Index\n\n')
for app, files in iter(sorted(INDEX.items())):
    T.write('- **%s**\n' % app)
    for file in files:
        T.write('\t- [%s](#%s)\n' % (Y[file]['name'], IDS[file]))

T.close()
