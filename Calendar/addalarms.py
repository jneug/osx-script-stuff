# name:           Add alarms to ics
# apps:           Caffeine, Alfred
# description:    Adds alarms to all events in an .ics file
# parameters:
#    _TRIGGERS:    "A list of times to trigger alarms at, **default**: `['-PT5H']`"
#    _ACTION:      "The action for the alarms, **default**: `DISPLAY`"
#    _SUFFIX       "A suffix to append to the filename, if no out file is defined, **default**: `'-w-alarms'`"
# compile:        false
import sys
import os
import icalendar
from datetime import datetime

# Configuration
_TRIGGERS = ['-PT5H']
_ACTION = 'DISPLAY'
_SUFFIX = '-w-alarms'

if len(sys.argv) < 2:
    sys.exit("Usage: python addalarms.py input.ics output.ics")

if sys.argv[1].endswith('.ics'):
    with open(sys.argv[1]) as ical_file:
        cal = icalendar.cal.Component.from_ical(ical_file.read())

    n = 0
    a = 0
    for sub in cal.subcomponents:
        for trigger in _TRIGGERS:
            alarm = icalendar.cal.Alarm()
            alarm['trigger'] = trigger
            alarm['action'] = _ACTION
            alarm['description'] = sub['summary']
            sub.add_component(alarm)
            a += 1
        n += 1

    if len(sys.argv) >= 3:
        with open(sys.argv[2], 'wb') as ical_result:
            ical_result.write(cal.to_ical())
    else:
        filename, ext = os.path.splitext(sys.argv[1])
        with open("%s%s.ics" % (filename, _SUFFIX), 'wb') as ical_result:
            ical_result.write(cal.to_ical())

    print('done: added %s alarms to %s events' % (a, n))
