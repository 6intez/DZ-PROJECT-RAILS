require "json"
require "selenium-webdriver"
require "rspec"
include RSpec::Expectations

describe "Test" do

  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "https://www.google.com/"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end

  after(:each) do
    @driver.quit
    @verification_errors.should == []
  end

  it "test_" do
    @driver.get "http://127.0.0.1:3000/"
    @driver.find_element(:link, "Home").click
    @driver.find_element(:link, "Русский").click
    @driver.find_element(:link, "English").click
    @driver.find_element(:link, "Русский").click
    @driver.find_element(:link, "Главная").click
    @driver.find_element(:link, "Book Appointment").click
    @driver.find_element(:id, "nextButton").click
    @driver.find_element(:id, "nextButton2").click
    @driver.find_element(:id, "inputName").click
    @driver.find_element(:id, "inputName").clear
    @driver.find_element(:id, "inputName").send_keys "Артем"
    @driver.find_element(:id, "inputPhoneNumber").click
    @driver.find_element(:id, "inputPhoneNumber").clear
    @driver.find_element(:id, "inputPhoneNumber").send_keys "chep2236@gmail.com"
    @driver.find_element(:id, "submitAppointment").click
    @driver.find_element(:link, "Sign Up").click
    @driver.find_element(:xpath, "//form[@id='new_user']/div[2]/em").click
    @driver.find_element(:id, "user_email").click
    @driver.find_element(:id, "user_email").clear
    @driver.find_element(:id, "user_email").send_keys "chep2236@gmail.com"
    @driver.find_element(:id, "user_password").click
    @driver.find_element(:id, "user_password").clear
    @driver.find_element(:id, "user_password").send_keys "123123"
    @driver.find_element(:id, "user_password_confirmation").click
    @driver.find_element(:id, "user_password_confirmation").clear
    @driver.find_element(:id, "user_password_confirmation").send_keys "123123"
    @driver.find_element(:name, "commit").click
    @driver.find_element(:link, "My account").click
    @driver.find_element(:xpath, "//button[@type='submit']").click
  end

  def element_present?(how, what)
    @driver.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end

  def alert_present?()
    @driver.switch_to.alert
    true
  rescue Selenium::WebDriver::Error::NoAlertPresentError
    false
  end

  def verify(&blk)
    yield
  rescue ExpectationNotMetError => ex
    @verification_errors << ex
  end

  def close_alert_and_get_its_text(how, what)
    alert = @driver.switch_to().alert()
    alert_text = alert.text
    if (@accept_next_alert) then
      alert.accept()
    else
      alert.dismiss()
    end
    alert_text
  ensure
    @accept_next_alert = true
  end
end