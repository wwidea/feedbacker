[![Gem Version](https://badge.fury.io/rb/feedbacker.png)](http://badge.fury.io/rb/feedbacker)
[![Code Climate](https://codeclimate.com/github/wwidea/feedbacker.png)](https://codeclimate.com/github/wwidea/feedbacker)

Feedbacker
==========

Feedbacker provides a tab for users to contact developers from within the application

Assumptions
-----------

Feedbacker assumes that you're using...

*  At least Rails 3.1.3
*  The Rails Asset Pipeline
*  Jquery
*  That you have a User class with email and name methods (name can be configured to something else)
*  and probably some other things that we've failed to mention.

Installation
------------
1. Add the following to your Gemfile.

        gem :feedbacker

2. Run `bundle install`

3. Add the following line to your application layout.

        <%= javascript_include_tag :feedbacker %>

4. Add the following line to your application layout before you call application.css. Override default settings in application.css.

        <%= stylesheet_link_tag :feedbacker %>

5. Add the following line at at appropriate position in your application layout.

        <%= render(:partial => 'feedbacker/tab') unless current_user.is_guest? %>

6. Add the folllowing line to config/application.rb.

        config.paths['db/migrate'] += Feedbacker::Engine.paths['db/migrate'].existent

   For Rails 4.2:
    
        config.paths['db/migrate'].concat(Feedbacker::Engine.paths['db/migrate'].existent)
    
7. Run `rake db:migrate` to add remarks table.

8. Create feedbacker.rb in config/initializers and add the following line.

        Feedbacker::SETTINGS.email_to = 'support@yourdomain.com'
    
  OR
  
        Feedbacker::SETTINGS.update do |settings|
          settings.email_to = 'support@yourdomain.com'
          settings.user_name_method = :name             # default value
          settings.email_prefix = '[FEEDBACKER]'        # default value
        end

9. Rails 4.2: Add this line to the top of your routes file.

        resources :remarks, :only => [:create]

Contributions
-------------

If have improvements to contribute to this gem, please feel free to fork, commit with tests (if applicable), and then send a pull request. Thank You!

Copyright (c) 2009-2013 WWIDEA, Inc. released under the MIT license
