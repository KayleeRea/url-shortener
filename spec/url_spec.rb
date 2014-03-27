require 'spec_helper'
require 'capybara/rspec'
require_relative '../app'

Capybara.app = App

feature 'Manages Homepage' do

  scenario 'user visits the homepage' do
    visit '/'
    fill_in "Type URL to shorten here", :with => 'http://tutorials.gschool.it'
    click_button 'Shorten'
  end
end