#!/usr/local/bin/python

import os
import re
import shutil
import subprocess
import sys
import tempfile

"""
Copied and modified for perforce from:
http://tech.myemma.com/python-pep8-git-hooks/

Add this alias to your .bash_profile:
$ alias psub='~/bin/perforce_pre_submit.py && p4 submit -r'

To use:
$ cd your_p4_repo
$ psub
"""

def system(*args, **kwargs):
    kwargs.setdefault('stdout', subprocess.PIPE)
    proc = subprocess.Popen(args, **kwargs)
    out, err = proc.communicate()
    return out


def main():
    
    modified = re.compile('^//depot/\s+(?P<name>.*\.py)', re.MULTILINE)
    files = system('p4', 'opened', '-C', '$P4CLIENT')
    files = modified.findall(files)
    print files
    sys.exit(1)

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
