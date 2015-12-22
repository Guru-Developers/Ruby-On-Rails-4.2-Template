# Ruby on Rails Template

Kammy edit

## Overview

- Prepared to deploy live on Heroku using Puma
- Install dependencies using the Gemfile by running "bundle install"
- Follow heroku commands to link with domain and deploy cycle on git
  - Heroku login
  - Log onto Heroku (GUI online) and create new domain and sync with git
  - git push heroku master (after commits)
- This framework build closely follows suggestions made by Michael Hartl (https://www.railstutorial.org/book)
- To run local server use "rails s" (default: http://localhost:3000)
- Remember to run migrations locally "rake db:migrate" as well as synchronizing Heroku databases via "heroku run:detached rake db:migrate"

## Installation

The above serves as a good overview on what the process of installation to deployment should look like. In order to try and ease the transition
of using Rails, I will provide further details on potential gotchas, recommended practices, and terminology not provided in Micahel Hartl's book
(at least based on my reading). Additionally, the book itself was mentioned to take three days to thoroughly examine (according to  the forward)
and I'd like to get started as soon as possible.

To begin with, Ruby has a hugely mature ecosystem of packages (i.e. gems) at your disposal. And while this is very useful for when you need to
get something done quickly (there is probably a gem for that!), it makes it difficult to figure out exactly which gem to use and the potential
dependencies of a certain gem. I have all too often been caught in this "dependency hell" and have learned that the best way to avoid this is
by working within virtual environments and using package managers. In particular, I recommend RVM and Bundler respectively, and will provide a
quick explanation on how they work together and how to get them running.

## Ruby Version Manager (RVM)

The RVM is a "command-line tool which allows you to easily install, manage, and work with multiple ruby environments from interpreters to sets of gems,"
according to the [RVM site](https://rvm.io). In particular, we'll first install RVM and then walk through the .rvmrc file and the way it interacts with
the Gemfile. To install:

```
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --rails --ruby=2.2.3
```

If you're like me, you want to understand what is actually happening during an installation. The `gpg` command references the GNU Privacy Guard, an
implementation of the OpenPGP standard, which allows encryption/decryption of data and key management related to said encryption/decryption. The
first line above pulls from the `--keyserver` the necessary keys (or key in our case) to receive so that we can pull down from `https://get.rvm.io`.
The `-sSL` flag means to `-s`ilence all progress (i.e. remove progress bars and the like), `S`how any errors, and install from a different `L`ocation
in the case that the server says our desired download is actually elsewhere.

By default, the installation will install necessary packages into `$HOME/.rvm`, which should be suitable in most cases. I personally haven't looked into
it, but if you'd like to install elsewhere, exclude the pipe in the second command and edit the script file downloaded.

### Version Control

When working with a Ruby project, look inside the Gemfile to determine which version of Ruby you are using (noted by the "ruby "2.2.x") near the top of
the file. RVM will automatically switch between versions depending on the Gemfile in the current directory (as seen by command `rvm info`). To actually
compartamentalize our gems, we will create a gemset and then use this when running our application or installing new gems as such:

```
rvm gemset create railsapp
rvm 2.2.3@railsapp
gem install bundler
bundle install
```

Note that `bundle install` reads in the Gemfile and installs the specified gems into the folder RVM designated for the 2.2.3@railsapp gemset. At this
point, you have a working version of Rails locally (by cloning the above project and running the given commands after installing RVM). Test this out
by writing `rails s`. Note that if this does not work correctly, it may be because of other dependencies. On my computer for instance, rails had trouble
starting the `uglifier` gem. This was because I needed the `nodejs` dependency, which I was able to fix by the following:

```
sudo apt-get install nodejs
```

Your situation may be different, so if there are any problems you'll have to take it from here.

## Heroku

Next up we examine the Platform as a Service (PaaS) [Heroku](https://www.heroku.com/home). Heroku allows us to push code up to the system itself
and immediately see our code up and running as if it was running on our local machine. To get this working, create a new account at Heroku and
create a Ruby app. Afterward, the installation of the toolbelt will follow accordingly.

Before beginning, make sure you have installed RVM and run the bundler. You must have ruby for the installation
to work so make sure you have sourced into your 2.2.3@railsapp environment. To get the Heroku toolbelt use the following
(this is assuming a Debian/Ubuntu OS):

```
wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh
```

Before you can begin pushing any changes, you must login to heroku as follows (I will provide the credentials to you later):

```
heroku login
```

Afterwards, one can create an application upstream and then push all changes to the master branch as so:

```
heroku create
git push heroku master
```

Note though that the above is only necessary if you are working on your own project. For our purposes, we will actually synchronize our github
and the heroku account so that whenever we merge changes to the master branch, our website is updated accordingly. That way you can avoid
adding more things onto your computer besides git.

## Advanced

As we continue further on, it will pay to learn more about what features Ruby on Rails provides and what gems are out there that can help
alleviate your work. When you have the chance, I highly recommend reading through Michael's book linked above and perhaps going through each
example. Additionally, when you begin working on a feature that you know many other sites implement, there is a good possibility a gem exists that
can help. Do your research, make sure the gem you're going to be working on is stable and active, and feel free to use the gem in these instances.

Happy coding!
