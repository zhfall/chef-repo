#
# Cookbook Name:: xl2tpd
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "xl2tpd" do
  action :install
end

template "/etc/xl2tpd/xl2tpd.conf" do
  source "xl2tpd.conf.erb"
  mode 0440
  owner "root"
  group "root"
end

template "/etc/ppp/options.xl2tpd" do
  source "options.xl2tpd.erb"
  mode 0440
  owner "root"
  group "root"
end

service "xl2tpd" do
  supports :restart => true
  action [ :enable, :restart ]
end
