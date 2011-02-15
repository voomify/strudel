
#
# Cookbook Name:: rvm
# Recipe:: default
#
# Copyright 2011, Voomify, LLC
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
include_recipe "rvm"

default_ruby = node[:rubies][:default]

# this sets the rvm up, runs bundler then runs rake db:create
node[:rubies][:install].each do |ruby_name|  

  template "/tmp/test_for_ruby.sh" do
    source "test_for_ruby.sh.erb"
    mode "0770"
    variables :ruby_name =>ruby_name
  end

  script "install ruby #{ruby_name}" do
      interpreter "bash"
      code <<-EOH
      [[ -s '/usr/local/lib/rvm' ]] && source '/usr/local/lib/rvm'
      rvm install #{ruby_name}
      EOH
      not_if "/tmp/test_for_ruby.sh"
  end

  script "set the default ruby (#{default_ruby}) and the permissions on the rvm directories" do
        interpreter "bash"
        code <<-EOH
        [[ -s '/usr/local/lib/rvm' ]] && source '/usr/local/lib/rvm'
        rvm --default #{default_ruby}        
        EOH
    end

end
