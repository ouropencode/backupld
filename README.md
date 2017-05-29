backupld
====

## What?
Backup framework, requires [Attic](https://attic-backup.org/)

## How?
Attic is a great tool that does all the magic we need, but you have to run it with certain configuration options on the command line. Rather than specify these in a crontab and flood it with multiple entries for all the different tweaks we might want to do, I wrote a wrapper script to do it.

The aim of this program is to provide functionality and configurability to the backup jobs on top of that which Attic provides. This includes a more detailed log file, weekly validity checks and email notifications. 909It's also written to depend on the use of SSH keys when connecting to the remote host (where the backups are stored), to keep your data safe.

## To install
Dependencies:

* [Attic](https://attic-backup.org/) (obviously)
* [cpfb](https://github.com/Joeasaurus/cpfb) for parsing the config
    * *Note*: As cpfb depends on bash v4.2, you will need to run backupld in 4.2
* cURL for sending emails (via [Mailgun](http://mailgun.com) or [Mandrill](http://mandrill.com))
* base64 (from [coreutils](https://www.gnu.org/software/coreutils/)) for encoding the log for attaching to emails.
* m4 for providing macros in custom message body and subject title
* mktemp for creating a temporary file to log into

You need to install Attic on both hosts for it to work. Attic requires Python 3+, which I got from PUIAS on CentOS 6.5 following these steps:

1. Get the [PUIAS repo](http://linuxsysconfig.com/2013/03/running-multiple-python-versions-on-centos6rhel6sl6/)
* `sudo yum install python3 python3-devel python3-setuptools`
* `sudo easy_install-3.3 -U pip`
* `sudo pip install Attic`

Once you've got this down, just stick the 'backupld' script somewhere useful like '/usr/local/bin' and stick it's config anywhere you like (I usually go for /etc/backupld.conf). You need cpfb to be in your path as well so backupld can find it.

For the SSH key to work, you will need to configure a Host entry in your SSH 'config' file. There is an example included in the repository.

Finally, here's an example 4AM crontab entry:

`0 4 * * * /usr/local/bin/bash-4.2 /usr/local/bin/backupld /etc/backupld.conf`

Released under the [MIT license](http://opensource.org/licenses/MIT)
