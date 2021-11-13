Sumo Logic BatchTools
=====================

Sumo Logic Batch tools are scripts designed to handle sumo queries at scale.
For example, these scripts allow users to run many queries for a single organization or many queries over a long time.

Installing the Scripts
=======================

The scripts are command line based, designed to be used within a batch script or DevOPs tool such as Chef or Ansible.
Each script is a python3 script. The complete list of the python modules can be installed using pip install.

You will need to use Python 3.6 or higher and the modules listed in the dependency section.  

The steps are as follows: 

    1. Download and install python 3.6 or higher from python.org. Append python3 to the LIB and PATH env.

    2. Download and install git for your platform if you don't already have it installed.
       It can be downloaded from https://git-scm.com/downloads
    
    3. Open a new shell/command prompt. It must be new since only a new shell will include the new python 
       path that was created in step 1. Cd to the folder where you want to install the scripts.
    
    4. Execute the following command to install pipenv, which will manage all of the library dependencies:
    
        sudo -H pip3 install pipenv 
 
    5. Clone this repository. This will create a new folder
    
    6. Change into this folder. Type the following to install all the package dependencies 
       (this may take a while as this will download all of the libraries it uses):

        pipenv install
        
Dependencies
============

See the contents of "pipfile"

Script Names and Purposes
=========================

The scripts are organized into sub directories:

    1. ./bin - has all of the scripts and driver programs
       ./bin/batchdriver.ksh
       ./bin/batchquery.py
    2. ./etc - has an example of a config file to set ENV variables for access
       ./etc/batchquery.cfg

Examples:
=========

    1. Display a sample help file
        prompt> ./batchquery.py -h

    2. Initialize a config file
        prompt> ./batchquery.py -i

    3. Use batchquery with a config file (recommended)
        prompt> ./batchquery.py -c /var/tmp/batchtools.initial.cfg

    4. Provide a time range (either relative or absolute)
        prompt> ./batchquery.py -c /var/tmp/batchtools.initial.cfg -r 1636806451000t:1636802851000t
        prompt> ./batchquery.py -c /var/tmp/batchtools.initial.cfg -r 36h:30h

    5. Add an extra sleep to avoid 429 issues
        prompt> ./batchquery.py -c /var/tmp/batchtools.initial.cfg -r 1636806451000t:1636802851000t -s 6

    6. Increae verbosity to see the results of the query run (from 1 to 9)
        prompt> ./batchquery.py -c /var/tmp/batchtools.initial.cfg -r 1636806451000t:1636802851000t -s 6 -v 6

License
=======

Copyright 2021 Wayne Kirk Schmidt

Licensed under the GNU GPL License (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    license-name   GNU GPL
    license-url    http://www.gnu.org/licenses/gpl.html

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

Support
=======

Feel free to e-mail me with issues to: wschmidt@sumologic.com
I will provide "best effort" fixes and extend the scripts.

