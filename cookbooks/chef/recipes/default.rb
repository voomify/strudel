gem_package 'chef'

script "install chef after rvm" do
  interpreter "bash"
  code <<-EOH
    source ~/.bash_profile
    gem install chef --no-ri --no-rdoc
    EOH
end
