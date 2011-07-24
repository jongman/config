#!/usr/bin/python
import glob
import os
current_dir = os.path.abspath(os.path.dirname(__file__))
j = lambda *args: os.path.join(current_dir, *args)

jobs = []
jobs += [(config, "~/.%s" % os.path.basename(config).lstrip("_"))
         for config in glob.glob(j("dotfiles/_*"))]
jobs += [(j("bin"), "~/bin")]

for path, target in jobs:
    target = os.path.expanduser(target)
    if os.path.lexists(target):
        print target, "already exists"
    else:
        os.symlink(path, target)
        print "created", target



