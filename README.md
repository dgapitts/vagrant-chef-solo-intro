
# Getting started with Chef-Solo: deploying a simple apache2 webserver

I have been struggling a little bit with 'Ruby/Gem Version Hell' on my laptop (MacOSX) and prefer working with Vagrant and Linux as 

  - This can be easily rebuilt in a 100% consistent maner (see blog post/link below for details)
  - No one is running MacOSX in their production datacenters, it is 100% Linux ... I love MaxOSX but for really work I am a Linux fan boy ...

So working through the following good article to get started with Chef and Knife: http://gettingstartedwithchef.com/first-steps-with-chef.html

I ended up running using a trusty64 (14.04) Ubuntu box image. I also broke the setup process into a scripts/steps which where to be run as root:

```sh
# startup and ssh to vagrant box:
vagrant up
vagrant ssh

# switch to root and work from cross-mounted vagrant directory (easier to inspect):
sudo -i
cd /vagrant
```
Note: I'm only running at root, as this is how the 'getting started with chef' tutorial was written. Some refactoring for better security could be done here...

Now the rest of the process is scripted

```sh
./step01_setup_chef-master-repo_under_slash_vagrant.sh
./step02_download_first_knife_cookbook.sh
./step03_configure_phpapp_cookbook.sh
chef-solo -c solo.rb -j web.json
```

Please inspect these scripts (i.e. in this git repo) for further details..

This approach is a good sansity check for check new Linux images and working through Ruby/Gem Version issues... here is a short blog post about some of the issues I had:

http://dba-amsterdam.blogspot.nl/2015/08/learning-chef-and-ruby-version-pain.html

Once you have this working, you should be able to mark a simple test call to Apache2 webserver:

```sh
root@knife1:/vagrant# curl http://localhost/index.htm

<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
<html><head>
<title>403 Forbidden</title>
</head><body>
<h1>Forbidden</h1>
<p>You don't have permission to access /index.htm
on this server.</p>
<hr>
<address>Apache Server at localhost Port 80</address>
</body></html>
```

OK ... displaying 'Hello Chef-Solo World' was my initial aim, but the key point is that Apache2 is up, running and complaining about suspect URL calls!

Lastly, as I was working under the cross-mounted /vagrant directory, as this easier to inspect (and edit) e.g. via my personal favorite editor: sublime text. However this makes the rebuild process slightly more complicated i.e. to completely rebuild the environment I needed to
  - destroy old box image
  - cleanup left over chef and knife (i.e. chef-solo) files under /vagrant
  - restart vagrant and ssh to nex box

So I scripted this:

```sh
~/projects/vagrant-chef-solo-intro $ cat rebuild.sh
vagrant destroy
rm -rf chef-repo
rm -rf chef-solo
vagrant up
vagrant ssh
```

