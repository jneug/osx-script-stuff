import os, glob, re, yaml
from subprocess import call

GLOB = '**/*.*'         # Glob pattern to use for including files
TARGET = 'README.md'    # Target file to generate
TEMPLATE = '_README.md' # Template to include as a header
MARKED = True           # Generate Marked compatible IDs
DEBUG = True           # Print some more info for debugging

TAGS = {
    '.applescript': ['(*', '*)'],
    '.sh': ['# '],
    '.py': ['# '],
    '.js': ['/*', '*/']
}
APPS = {
    'Alfred': 'http://alfredapp.com',
    'TextExpander': 'https://smilesoftware.com/TextExpander/index.html',
    'Airmail 2': 'http://airmailapp.com',
    'CommonMark': 'http://commonmark.org',
    'Markdown': 'https://daringfireball.net/projects/markdown/',
    'Tag': 'https://github.com/jdberry/tag/',
    'Mail': 'https://www.apple.com/support/mac-apps/mail/',
    'iTunes': 'https://www.apple.com/support/mac-apps/iTunes/'
}
COMPILER = {
    '.applescript': {
        'call': 'osacompile -x -o %s %s',
        'filename': '%s.scpt'
    }
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
        # Deal with shebangs
        if line.startswith('#!'):
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
        if MARKED:
            if i == 1:
                i = 2
            _id = '%s%s' % (__id, i)
        else:
            _id = '%s-%s' % (__id, i)
        i += 1
    _IDS.append(_id)
    return _id

Y = {}
IDS = {}
files = glob.glob(GLOB)
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
            except Exception as e:
                if DEBUG:
                    print('\x1b[0;31m>\x1b[0m couldn\'t parse frontmatter for \x1b[0;35m%s\x1b[0m' % file)
                    print('\x1b[0;31m=>\x1b[0m %s' % e)
                pass
    else:
        if DEBUG:
            print('\x1b[0;31m>\x1b[0m skipped \x1b[0;35m%s\x1b[0m, extension \x1b[0;35m%s\x1b[0m not registered' % (file, ext))

T = open(TARGET, 'w')

INDEX = {}

# Generate header
header = open(TEMPLATE).read();
T.write(header);
T.write('\n\n')
print('\x1b[0;32m>\x1b[0m Added headers from \x1b[0;35m%s\x1b[0m to documentation' % TEMPLATE)

# Generate TOC
T.write('## Table of contents\n\n')
T.write('1. [Scripts](#scripts)\n')
for file, yml in iter(sorted(Y.items())):
    T.write('\t- [%s](#%s)\n' % (yml['name'], IDS[file]))
T.write('2. [App Index](#app-index)\n')
T.write('3. [Script Index](#script-index)\n')
T.write('\n')
print('\x1b[0;32m>\x1b[0m Created table of contents')

# Generate docs
T.write('## Scripts\n\n')
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
    T.write('%s\n\n' % yml['description'])

    T.write('- Apps: %s\n' % ', '.join(apps))
    T.write('- File: [_%s_](./%s)\n' % (file, file))
    if 'parameters' in yml and not yml['parameters'] == None and len(yml['parameters']) > 0:
        T.write('- Parameters:\n')
        for param, descr in yml['parameters'].items():
            # T.write('- **%s**  \n\t%s\n' % (param, descr))
            T.write('\t- **%s**: %s\n' % (param, descr))

    print('\x1b[0;32m>\x1b[0m Added \x1b[0;35m%s\x1b[0m to documentation' % file)

    name, ext = os.path.splitext(file)
    if 'compile' in yml and yml['compile'] == True and ext in COMPILER:
        newfile = COMPILER[ext]['filename'] % name
        call(COMPILER[ext]['call'] % (newfile, file), shell=True)
        T.write('- Binary: [_%s_](./%s)\n' % (newfile,newfile))

        print('\x1b[0;32m=>\x1b[0m Created binary at \x1b[0;35m%s\x1b[0m' % newfile)

    T.write('\n\n')

# Generate index
T.write('## App Index\n\n')
for app, files in iter(sorted(INDEX.items())):
    T.write('- **%s**  \n\t' % app)
    T.write(', '.join(['[%s](#%s)' % (Y[file]['name'], IDS[file]) for file in files]))
    T.write('\n')
T.write('\n')
print('\x1b[0;32m>\x1b[0m Created application index')

# Generate alphabetical script index
lastChar = ''
T.write('## Script Index\n\n')
for file, yml in iter(sorted(Y.items(), key=lambda x: x[1]['name'])):
    if not yml['name'][0:1] == lastChar:
        lastChar = yml['name'][0:1].upper()
        T.write('\n- **%s**  \n\t' % lastChar)
        T.write('[%s](#%s)' % (yml['name'], IDS[file]))
    else:
        T.write(', [%s](#%s)' % (yml['name'], IDS[file]))
T.write('\n')
print('\x1b[0;32m>\x1b[0m Created script index')

T.close()
