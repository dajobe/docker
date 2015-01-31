Docker repositories
===================


References
----------

https://docs.docker.com/articles/dockerfile_best-practices/

http://crosbymichael.com/dockerfile-best-practices-take-2.html

https://journal.paul.querna.org/articles/2013/10/15/docker-ubuntu-on-rackspace/

https://github.com/phusion/baseimage-docker/blob/master/image/prepare.sh

https://github.com/docker/docker/blob/master/contrib/mkimage/debootstrap

  Standard mkinstall below includes initrd fix, dpkg apt speedup
  and preventing service starting by policy-rc.d and/or upstart


Probably don't need to worry about this:

> Replace the 'ischroot' tool to make it always return true.
> Prevent initscripts updates from breaking /dev/shm.
> https://journal.paul.querna.org/articles/2013/10/15/docker-ubuntu-on-rackspace/
> https://bugs.launchpad.net/launchpad/+bug/974584
>
> dpkg-divert --local --rename --add /usr/bin/ischroot
> ln -sf /bin/true /usr/bin/ischroot

