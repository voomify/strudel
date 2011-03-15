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
  wget http://wkhtmltopdf.googlecode.com/files/wkhtmltopdf-OSX-0.10.0_rc2-static.tar.bz2
  tar -xvjf wkhtmltopdf-OSX-0.10.0_rc2-static.tar.bz2
  cp ./wkhtmltopdf /usr/local/bin
  EOH
end

