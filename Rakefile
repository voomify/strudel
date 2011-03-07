# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

begin
  require 'chef'

  namespace :strudel do
    task :install do |t, args|
      system("chef-solo -j config/run_list.json -c config/solo.rb")
    end
  end
rescue LoadError => e
  puts e.message
  puts "You don't seem to have chef, installing it for you"
  system("sudo gem install chef --no-rdoc --no-ri")
  puts "chef has been installed for you, please rerun 'rake strudel'"
end

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

begin
  require 'chef'

  namespace :strudel do
    task :install do |t, args|
      system("chef-solo -j config/run_list.json -c config/solo.rb")
    end
  end
rescue LoadError => e
  puts e.message
  puts "You don't seem to have chef, installing it for you"
  system("sudo gem install chef --no-rdoc --no-ri")
  puts "chef has been installed for you, please rerun 'rake strudel'"
end

