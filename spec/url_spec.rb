require 'spec_helper'
require 'capybara/rspec'
require_relative '../app'

Capybara.app = App

feature 'Manages Homepage' do

  scenario 'user visits the homepage' do
    visit '/'
    fill_in "Type URL to shorten here", :with => 'http://tutorials.gschool.it'
    click_button 'Shorten'
    expect(page).to have_content "http://tutorials.gschool.it"
    expect(page).to have_content "http://still-taiga-3763.herokuapp.com/1"
  end
end