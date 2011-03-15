#
# Cookbook Name:: prince
# Recipe:: default
#
# Copyright 2011, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

script "install wkhtmltopdf" do
  interpreter "bash"
  cwd "/tmp"
  code <<-EOH
  wget http://wkhtmltopdf.googlecode.com/files/wkhtmltopdf-0.10.0_rc2.tar.bz2
  tar -zxf wkhtmltopdf-0.10.0_rc2.tar.bz2
  cp ./wkhtmltopdf /usr/local/bin
  EOH
end

