#!/usr/bin/python
import glob
import os
current_dir = os.path.abspath(os.path.dirname(__file__))

jobs = []
jobs += [(config, "~/.%s" % os.path.basename(config).lstrip("_"))
         for config in glob.glob("dotfiles/_*")]
jobs += [("bin", "~/bin")]

for path, target in jobs:
    target = os.path.expanduser(target)
    if os.path.lexists(target):
        print target, "already exists"
    else:
        os.symlink(os.path.join(current_dir, path), target)
        print "created", target



