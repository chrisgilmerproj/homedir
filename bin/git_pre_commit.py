#!/usr/local/bin/python
from __future__ import with_statement
import os
import re
import shutil
import subprocess
import sys
import tempfile

"""
Copied whole sale from:
http://tech.myemma.com/python-pep8-git-hooks/

To install on OSX put in the file:
/usr/local/git/share/git-core/templates/hooks/pre-commit

To use on an existing repo simply re-initialize it:
$ cd your_git_repo
$ git init
"""

def system(*args, **kwargs):
    kwargs.setdefault('stdout', subprocess.PIPE)
    proc = subprocess.Popen(args, **kwargs)
    out, err = proc.communicate()
    return out


def main():
    
    modified = re.compile('^[AM]+\s+(?P<name>.*\.py)', re.MULTILINE)
    files = system('git', 'status', '--porcelain')
    files = modified.findall(files)
 
    tempdir = tempfile.mkdtemp()
    for name in files:
        filename = os.path.join(tempdir, name)
        filepath = os.path.dirname(filename)
        if not os.path.exists(filepath):
            os.makedirs(filepath)
        with file(filename, 'w') as f:
            system('git', 'show', ':' + name, stdout=f)

    failed = False

    print "Testing with pep8"
    output = system('pep8', '--ignore=E261,E501', '--repeat', '.', cwd=tempdir)
    if output:
        print output
        failed = True

    print "Testing with pyflakes"
    output = system('pyflakes', '.', cwd=tempdir)
    if output:
        print output
        failed = True

    shutil.rmtree(tempdir)

    if failed:
        sys.exit(1)

if __name__ == '__main__':
    main()
