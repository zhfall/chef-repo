#
# Cookbook Name:: pptpd
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

case node['platform']
when "centos","amazon","redhat"
  package "ppp" do
    action :install
  end

  cookbook_file "/tmp/pptpd-1.3.4-2.el6.i686.rpm" do
    source "pptpd-1.3.4-2.el6.i686.rpm"
    mode 0777
    owner "root"
    group "root"
  end

  package "pptpd" do
    action :install
    source "/tmp/pptpd-1.3.4-2.el6.i686.rpm"
    provider Chef::Provider::Package::Rpm
  end
when "ubuntu","debian"
  package "pptpd" do
    action :install
  end
end

template "/etc/pptpd.conf" do
  source "pptpd.conf.erb"
  mode 0440
  owner "root"
  group "root"
end

template "/etc/ppp/options.pptpd" do
  source "options.pptpd.erb"
  mode 0440
  owner "root"
  group "root"
end

template "/etc/ppp/chap-secrets" do
  source "chap-secrets.erb"
  mode 0400
  owner "root"
  group "root"
end

service "pptpd" do
  supports :restart => true
  action [ :enable, :restart ]
end
