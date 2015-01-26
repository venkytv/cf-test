# cf-test

Cloud Foundry buildpack to set up an Apache-fronted Tomcat instance
and deploy provided web applications to it.

Building the bundles
--------------------

    $ vagrant up
    $ vagrant ssh
    vagrant@ubuntu-lucid64:~$ /vagrant/bin/build.sh
    vagrant@ubuntu-lucid64:~$ exit
    $ vagrant destroy

This creates/updates the bundles in vendor/bundles.

Deploying to Cloud Foundry
--------------------------

    # From the root of the repository
    $ cp <webapp1.war> [<webapp2.war> ...] $PWD
    $ cf push
