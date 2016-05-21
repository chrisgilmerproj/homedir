#! /bin/bash

# The order of the versions is super important.
# Don't let your OCD get the best of you.
VERSIONS='2.7.11 3.5.1 3.4.4 3.3.6 2.6.9'

for version in ; do echo $version; pyenv install $version; done

pyenv global $VERSION
