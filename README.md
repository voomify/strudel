strudel
=======

This is another Chef based project that will initialize your Apple OS X machine with a full rails stack.
It is designed to be used on a clean OS X machine.  Your mileage may vary.

You can customize the stack as you see fit, by modifying the recipes it runs.

Strudel is a pastry created by a chef. A common strudel is apple.  MMMM tasty.

What it does
============

* Installs [homebrew]
* Installs [git]
* Installs [rvm] and sets up 1.8.7 to be the default
* Installs [rails]

Prerequisites
=============
XCode Dev Tools  (install from your OS X DVD)

If you get a message about not being able to find make.  You need to install XCode Dev Tools.

Running
=======

    % rake strudel:install

[git]: http://git-scm.com/
[rvm]: http://rvm.beginrescueend.com
[mysql]: http://www.mysql.com/
[homebrew]: http://github.com/mxcl/homebrew
[memcached]: http://memcached.org/
[postgresql]: http://www.postgresql.org/
[rails]: http://rubyonrails.org/
