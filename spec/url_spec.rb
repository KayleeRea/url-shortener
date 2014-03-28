require 'spec_helper'
require 'capybara/rspec'
require_relative '../app'

Capybara.app = App

feature 'Manages Homepage' do

  scenario 'user visits the homepage' do
    visit '/'
    fill_in "Type URL to shorten here", :with => 'tutorials.gschool.it'
    click_button 'Shorten'
    expect(page).to have_content "tutorials.gschool.it"
    expect(page).to have_content "http://www.example.com/1"

    visit "/1"
    current_url.should == "http://tutorials.gschool.it/"
  end
end