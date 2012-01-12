require "calendar_date_select/calendar_date_select.rb"
require "calendar_date_select/form_helpers.rb"
require "calendar_date_select/includes_helper.rb"

require 'rails'
require 'active_support'

module CalendarDateSelect

  Files = [
    '/public',
    '/public/javascripts/calendar_date_select',
    '/public/stylesheets/calendar_date_select', 
    '/public/images/calendar_date_select',
    '/public/javascripts/calendar_date_select/locale'
  ]

  class Railtie < ::Rails::Railtie

    initializer 'calendardateselect.initialize', :after => :action_view do
      ActionView::Helpers::FormHelper.send(:include, CalendarDateSelect::FormHelpers)
      ActionView::Base.send(:include, CalendarDateSelect::FormHelpers)
      ActionView::Base.send(:include, CalendarDateSelect::IncludesHelper)
  
      ActionView::Helpers::InstanceTag.class_eval do
        class << self; alias new_with_backwards_compatibility new; end #TODO: singleton_class.class_eval
      end
    end

  end # Railtie
end # module

