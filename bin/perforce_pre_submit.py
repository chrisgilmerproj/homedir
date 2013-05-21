#!/usr/local/bin/python

import os
import re
import subprocess
import sys

"""
Copied and modified for perforce from:
http://tech.myemma.com/python-pep8-git-hooks/

Add this alias to your .bash_profile:
$ alias psub='~/bin/perforce_pre_submit.py && p4 submit -r'

To use:
$ cd your_p4_repo
$ psub
"""

P4HOME = '/home/cgilmer/sbwork/'

def system(*args):
    proc = subprocess.Popen(args, shell=False,
        stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    stdout, stderr = proc.communicate()
    return stdout


def main():
    
    modified = re.compile('^//depot/(?P<name>.*\.py)', re.MULTILINE)
    client = os.environ['P4CLIENT']
    files = system('p4', 'opened', '-C', client)
    files = modified.findall(files)

    failed = False

    print "Testing with pep8"
    for name in files:
        name = os.path.join(P4HOME, name)
        output = system('pep8', '--ignore=E126,E127,E128,E261,E501', '--repeat', name)
        if output:
            print output
            failed = True

    print "Testing with pyflakes"
    for name in files:
        name = os.path.join(P4HOME, name)
        output = system('pyflakes', name)
        if output:
            print output
            failed = True

    if failed:
        print "Failed, will not submit"
        sys.exit(1)

if __name__ == '__main__':
    main()
