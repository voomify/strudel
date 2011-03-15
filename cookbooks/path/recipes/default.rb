#
# Cookbook Name:: path
# Recipe:: default
#
# Copyright 2011, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
script "add path to .MacOSX/environment.plist" do
  interpreter "bash"
  code <<-EOH
    mkdir -p ~/.MacOSX
    echo "<?xml version='1.0' encoding='UTF-8'?>" > ~/.MacOSX/environment.plist
    echo "<!DOCTYPE plist PUBLIC '-//Apple Computer//DTD PLIST 1.0//EN' 'http://www.apple.com/DTDs/PropertyList-1.0.dtd'>" >> ~/.MacOSX/environment.plist
  echo "<plist version='1.0'>" >> ~/.MacOSX/environment.plist
  echo "<dict>" >> ~/.MacOSX/environment.plist
    echo "<key>PATH</key>" >> ~/.MacOSX/environment.plist
    echo "<string>$PATH</string>" >> ~/.MacOSX/environment.plist
  echo "</dict>" >> ~/.MacOSX/environment.plist
  echo "</plist>" >> ~/.MacOSX/environment.plist
  EOH
end