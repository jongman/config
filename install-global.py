#!/usr/bin/python
import os
import commands
assert commands.getoutput("whoami") == "root"

current_dir = os.path.abspath(os.path.dirname(__file__))
j = lambda *args: os.path.join(current_dir, *args)

targets = [line.strip() for line in open(j("global/list.txt"))]
jobs = [(j("global", os.path.basename(target)), target)
        for target in targets]
for path, target in jobs:
    target = os.path.expanduser(target)
    if os.path.lexists(target):
        print target, "already exists"
    else:
        os.symlink(path, target)
        print "created", target



