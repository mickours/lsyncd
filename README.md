# lsyncd
Automatically exported from code.google.com/p/lsyncd

lsyncd(1)
=========
:doctype: manpage
:man source: Lsyncd
:man manual: Lsyncd
:man version: 2.0.5
:date: August 2011

NAME
----
lsyncd - a daemon to continuously synchronize directory trees 

SYNOPSIS
--------
config file:::
	{nbsp}*lsyncd* ['OPTIONS'] 'CONFIG-FILE' 

default rsync behaviour:::
	{nbsp}*lsyncd* ['OPTIONS'] -rsync 'SOURCEDIR' 'TARGET' ...

default rync+ssh bevahiour (moves and deletes through ssh):::
	{nbsp}*lsyncd* ['OPTIONS'] -rsyncssh 'SOURCEDIR' 'TARGETHOST' 'TARGETDIR' ...

default direct bevahiour (local file operations/rsync):::
	{nbsp}*lsyncd* ['OPTIONS'] -direct 'SOURCEDIR' 'TARGETDIR' ...

DESCRTIPTION
------------
Lsyncd(1) watches local directory trees through an event monitor interface
(inotify, fsevents).  It aggregates and combines events for a few seconds and
then spawns one or more processes to synchronize the changes. By default this
is rsync(1).  Lsyncd is thus a light-weight asynchronous live mirror solution
that is comparatively easy to install not requiring new filesystems or
blockdevices and does not hamper local filesystem performance.

Rsync+ssh is an advanced action configuration that uses a SSH(1) to act file
and directory moves directly on the target instead of retransmitting the move
destination over the wire.

Fine-grained customization can be achieved through the CONFIG-FILE.  Custom
action configs can even be written from scratch in cascading layers ranging
from shell scripts to code written in the LUA(1) language.  This way simplicity
can be balanced with powerfulness.  See the online manual for details on the
CONFIG-FILE http://code.google.com/p/lsyncd/wiki/Lsyncd20Manual

Note that under normal configuration Lsyncd will delete pre-existing files in
the target directories that are not present in the respective source directory.

OPTIONS
-------
*-delay* 'SECS'::
	Overrides the default delay times.

*-help*::
	Show a help message.

*-insist*::
	Continues startup even if a startup rsync cannot connect.

*-log* 'LEVEL'::
	Controls which kind of events are logged. By default Lsyncd logs 'Normal'
	and 'Error' Messages. *-log scarce* will make Lsyncd log Error messages
	only. *-log all* will log all
	debug messages. 
	
*-log* 'Category'::
	Turns on a specific debug message. E.g. *-log Exec* will log
	all processes as they are spawned.

*-nodaemon*::
	Lsyncd will not detach from the invoker and log as well to stdout/err.

*-pifile* 'FILE'::
	Lsyncd will write its process ID in 'FILE'.

*-runner* 'FILE'::
	Makes the Lsyncd core load the part of Lsyncd written in Lua from 'FILE' 

*-version*::
	Writes version information and exits.

EXIT STATUS
-----------
*0*::
    Terminated on a TERM signal(7)

*-1*::
	Failure (syntax, unrecoverable error condition, internal failure)

SEE ALSO
--------
Online Manual: http://code.google.com/p/lsyncd/wiki/Lsyncd2

VERSION
------
This man page is for lsyncd(1) version 2.0.5

AUTHOR
------
Axel Kittenberger, <axkibe@gmail.com> 2010-2011

COPYING 
------- 
Copyright \(C) 2010-2011 Axel Kittenberger. Free use of this software is granted
under the terms of the GNU General Public License (GPL) version 2, or any later
version. Free redistrubition of this Documentation (/doc directory) is granted
under the terms of the Creative Commons 3.0 Attribution License (CC-3.0-BY).

