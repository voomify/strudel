#/postgresql.conf.
# Cookbook Name:: postgresql
# Recipe:: server
#
# Copyright 2009, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "postgresql::client"

package "postgresql"

case node.platform
when "redhat","centos","fedora","suse"
  package "postgresql-server"
end

#service "postgresql" do
#  case node[:platform]
#  when "debian","ubuntu"
#    service_name "postgresql-#{node.postgresql.version}"
#  end
#  supports :restart => true, :status => true, :reload => true
#  action :nothing
#end

template "#{node[:postgresql][:dir]}/pg_hba.conf" do
  source "pg_hba.conf.erb"
  mode 0600
  #notifies :reload, resources(:service => "postgresql")
end

template "#{node[:postgresql][:dir]}/postgresql.conf" do
  source "postgresql.conf.erb"
  mode 0600
  variables :version => node.postgresql.version
  #notifies :restart, resources(:service => "postgresql")
end

script "create initial postgres database" do
  interpreter "bash"
  code <<-EOH
    sudo sysctl -w kern.sysv.shmall=65536
    sudo sysctl -w kern.sysv.shmmax=16777216
    mkdir -p /usr/local/var/postgres
    /usr/local/bin/initdb /usr/local/var/postgres -E "UTF8"
    EOH
    not_if {File.exists?("/usr/local/var/postgres/PG_VERSION")}
end

script "create /etc/sysctl.conf" do
  interpreter "bash"
  code <<-EOH
        sudo su root -c "echo 'kern.sysv.shmall=65536' > /etc/sysctl.conf"
        sudo su root -c "echo 'kern.sysv.shmmax=16777216' >> /etc/sysctl.conf"
  EOH
  not_if {File.exists?("/etc/sysctl.conf")}
end


script "automatically load postgres on login" do
  interpreter "bash"
  code <<-EOH
  cp #{node[:postgresql][:dir]}/org.postgresql.postgres.plist ~/Library/LaunchAgents
  launchctl load -w ~/Library/LaunchAgents/org.postgresql.postgres.plist
    EOH
end

script "create the 'rails' postgres superuser role" do
  interpreter "bash"
  code <<-EOH
  echo "CREATE ROLE rails WITH SUPERUSER CREATEDB CREATEROLE LOGIN ENCRYPTED PASSWORD '';" | psql -d postgres
  EOH
end



