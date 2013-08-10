#
# Cookbook Name:: openswan
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

case node['platform']
when "centos","amazon","redhat"
  cookbook_file "/tmp/openswan-2.6.32-16.el6.i686.rpm" do
    source "openswan-2.6.32-16.el6.i686.rpm"
    mode 0777
    owner "root"
    group "root"
  end

  package "oepnswan" do
    action :install
    source "/tmp/openswan-2.6.32-16.el6.i686.rpm"
    provider Chef::Provider::Package::Rpm
  end

  template "/etc/yum.conf" do
    source "yum.conf.erb"
    mode 0440
    owner "root"
    group "root"
  end
when "ubuntu","debian"
  package "openswan" do
    action :install
  end
end

template "/etc/ipsec.conf" do
  source "ipsec.conf.erb"
  mode 0440
  owner "root"
  group "root"
end

template "/etc/ipsec.secrets" do
  source "ipsec.secrets.erb"
  mode 0400
  owner "root"
  group "root"
end

service "ipsec" do
  supports :restart => true
  action [ :enable, :restart ]
end
