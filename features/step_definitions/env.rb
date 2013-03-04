require 'capybara/cucumber'
require 'selenium-webdriver'

Capybara.default_driver = :selenium
Capybara.register_driver :selenium do |app|
  driver = Capybara::Selenium::Driver.new(app, 
                                          :browser => :chrome,
                                          :switches => %w[--ignore-certificate-errors --disable-popup-blocking --disable-translate])
end

Before do |scenario|
  system('http-static-server -path="./www-src/" &')
end

After do |scenario|
  visit("http://localhost:8888/")
  find_link("Settings").click
  find_link("Reset").click
  find_link("Yes, I'm really sure").click
  #system('killall http-static-server')
end

