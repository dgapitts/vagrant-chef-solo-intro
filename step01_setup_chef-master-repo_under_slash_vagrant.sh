#setup chef-master-repo under /vagrant
cd /vagrant 
wget http://github.com/opscode/chef-repo/tarball/master
tar -zxf master
mv chef-chef-repo* chef-repo
rm master
cd chef-repo
ls