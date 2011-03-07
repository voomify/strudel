gem_package 'chef'

script "install chef after rvm" do
  interpreter "bash"
  code <<-EOH
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
    gem install chef --no-ri --no-rdoc
    EOH
end
