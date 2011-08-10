strudel
=======

This is another Chef based project that will initialize your Apple OS X machine with a full development stack.
It is designed to be used on a clean OS X machine.  Your mileage may vary.

You can customize the stack as you see fit, by modifying the recipes it runs.

Strudel is a pastry created by a chef. A common flavor of strudel is apple.  MMMM tasty.

What it does
============
* Installs [homebrew]
* Installs [git]
* Installs [postgresql]
* Installs [rvm] and sets up 1.8.7 to be the default
* Setups up optional packages - (you can edit this list. - edit config/run_list.json)


Prerequisites
=============
Ruby and Rubygems. (This should be on your Mac already.)

XCode Dev Tools  (Install from your OS X DVD)

If you get a message about not being able to find make.  You need to install XCode Dev Tools.

Running
=======
Download this project as a tarball and expand it.

gem install rubygems-update

echo 'export PATH=~/.gem/ruby/1.8/bin:$PATH' > ~/.bash_profile

source ~/.bash_profile

gem install bundler --no-ri --no-rdoc

bundle install

chef-solo -j config/run_list.json -c config/solo.rb

References
==========
[git]: http://git-scm.com/
[rvm]: http://rvm.beginrescueend.com
[mysql]: http://www.mysql.com/
[homebrew]: http://github.com/mxcl/homebrew
[postgresql]: http://www.postgresql.org/



Copyright Russell Edens and Voomify, LLC All Rights Reserved.