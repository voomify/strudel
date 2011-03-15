#
# Cookbook Name:: prince
# Recipe:: default
#
# Copyright 2011, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

script "install prince" do
  interpreter "bash"
  cwd "/tmp"
  code <<-EOH
  wget http://www.princexml.com/download/prince-7.1-macosx.tar.gz
  tar -zxf prince-7.1-macosx.tar.gz
  cd prince-7.1-macosx
  ./install.sh
  EOH
end
