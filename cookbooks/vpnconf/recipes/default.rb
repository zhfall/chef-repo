#
# Cookbook Name:: vpnconf
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template "/etc/rc.local" do
  source "rc.local.erb"
  mode 0755
  owner "root"
  group "root"
end

script "run rc.local" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code <<-EOH
  source /etc/rc.local
  EOH
end
