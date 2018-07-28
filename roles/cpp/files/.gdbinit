set startup-with-shell off
set history save
set confirm off
set verbose off
set print pretty on
set print array off
set print array-indexes on
set python print-stack full
python from gdbinit import *
python Dashboard.start()
