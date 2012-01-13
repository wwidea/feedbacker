Feedbacker
==========

Feedbacker provides a tab for users to contact developers from within the application

Assumptions
-----------

Feedbacker assumes that you're using...

*  At least Rails 3.1.3
*  The Rails Asset Pipeline
*  Jquery
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

    config.paths['db/migrate'] = Feedbacker::Engine.paths['db/migrate'].existent

7. Run `rake db:migrate` to add remarks table.

8. Create feedbacker.rb in config/initializers and add the following line.

    Feedbacker::EMAIL_TO = 'support@yourdomain.com'

9. (Optional) You may also add either or both of the following lines and edit to taste. Defaults are shown.

    Feedbacker::RemarkMethods::USER_NAME_METHOD = :first_last
    Feedbacker::EMAIL_PREFIX = '[FEEDBACKER]'

Copyright (c) 2009 WWIDEA, Inc. released under the MIT license


Contributions
-------------

If have improvements to contribute to this gem, please feel free to fork, commit with tests (if applicable), and then send a pull request. Thank You!
