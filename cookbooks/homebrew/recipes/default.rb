script "create /usr/local and add admin group to it" do
  interpreter "bash"
  code <<-EOH
  sudo mkdir /usr/local
  sudo chgrp admin /usr/local
  sudo chmod 775 /usr/local
  EOH
  not_if "test -d /usr/local"
end

execute "install homebrew" do
  command "curl -sfL https://github.com/mxcl/homebrew/tarball/master | tar zx -m --strip 1"
  cwd "/usr/local"
  not_if { File.exist? '/usr/local/bin/brew' }
end

package 'git'

execute "update homebrew from github" do
  command "/usr/local/bin/brew update || true"
end
