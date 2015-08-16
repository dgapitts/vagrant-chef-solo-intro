#configure phpapp cookbook add apache2

echo 'Tells Chef our cookbook relies on the apache2 cookbook to function'
echo 'adding: dependency for apache2 in chef-repo/cookbooks/phpapp/metadata.rb'
echo 'depends "apache2"' >> /vagrant/chef-repo/cookbooks/phpapp/metadata.rb
echo 'Updated file : '
cat /vagrant/chef-repo/cookbooks/phpapp/metadata.rb
echo ''
echo ''

echo 'adding: dependency for apache2 in chef-repo/cookbooks/phpapp/metadata.rb'
echo 'include_recipe "apache2"' >> /vagrant/chef-repo/cookbooks/phpapp/recipes/default.rb 
echo 'apache_site "default" do' >> /vagrant/chef-repo/cookbooks/phpapp/recipes/default.rb 
echo '  enable true           ' >> /vagrant/chef-repo/cookbooks/phpapp/recipes/default.rb 
echo 'end                     ' >> /vagrant/chef-repo/cookbooks/phpapp/recipes/default.rb 
echo 'Updated file : '
cat /vagrant/chef-repo/cookbooks/phpapp/recipes/default.rb
echo ''
echo ''


