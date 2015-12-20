#~Ruby on Rails Template~
###For quick set ups and deploys


-Prepared to deploy live on Heroku using Puma
-Install dependencies using the Gemfile by running "bundle install"
-Follow heroku commands to link with domain and deploy cycle on git
  -Heroku login
  -Log onto Heroku (GUI online) and create new domain and sync with git
  -git push heroku master (after commits)
-This framework buid closely follows suggestions made by Michael Hartl (https://www.railstutorial.org/book)
-To run local server use "rails s" (default: http://localhost:3000)
-Remember to run migrations locally "rake db:migrate" as well as synchronizing Heroku databases via "heroku run:detached rake db:migrate"





