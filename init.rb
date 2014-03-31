# -*- encoding : utf-8 -*-
require 'redmine'
require 'best_in_place'

Redmine::Plugin.register :redmine_spent_time do
  name 'Redmine Spent Time plugin'
  author 'Eduardo Yáñez Parareda'
  description 'Redmine\'s plugin to show and load projects\' spent time'
  version '2.6.5'

  permission :view_spent_time, {:spent_time => [:index]}
  permission :view_others_spent_time, {:spent_time => [:index]}
  permission :view_every_project_spent_time, {:spent_time => [:index]}

  menu(:top_menu, 
       :spent_time,
       {:controller => "spent_time", :action => 'index'},
       :caption => :spent_time_title,
       :if => Proc.new{ User.current.allowed_to?(:view_spent_time, nil, :global => true)})
end

