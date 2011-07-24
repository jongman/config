#!/usr/bin/python
import glob
import os
current_dir = os.path.dirname(__file__)
for config in glob.glob("_*"):
    target = os.path.expanduser("~/.%s" % config.lstrip("_"))
    if os.path.lexists(target):
        print target, "already exists"
    else:
        os.symlink(os.path.join(current_dir, config), target)
        print "created", target



