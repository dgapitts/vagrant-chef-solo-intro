#initial setup/download of first knife cookbook phpapp
cd chef-repo/
mkdir .chef
echo "cookbook_path [ '/vagrant/chef-repo/cookbooks' ]" > .chef/knife.rb
knife cookbook create phpapp
cd cookbooks

knife cookbook site download apache2
tar zxf apache2*
rm apache2*.tar.gz

knife cookbook site download apt
tar zxf apt*
rm apt*.tar.gz

