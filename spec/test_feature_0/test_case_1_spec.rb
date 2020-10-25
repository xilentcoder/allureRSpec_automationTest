require_relative '../spec_helper'

describe 'Login', severity: :normal do
  it 'checks landing page' do 
  
  
  #welcomeTxt = @driver.find_element(xpath: "//*[text()='Welcome to Cloud Bank']")).text
              
  welcomeTxt = @driver.find_elements(xpath: "//*[text()='Welcome to Cloud Bank']").length #notice I use find_elements instead of find_element
  expect(welcomeTxt).to be < 0

  end

  it 'enters account', severity: :critical do

   username_box = @driver.find_element(name: 'username')
   
   username_box.send_keys 'tester'
  
  passbox = @driver.find_element(name: 'password')
  
  passbox.send_keys 'password@1234', :return
  
  checkLoggedIn = @driver.find_elements(link_text: 'System Users').length
   expect(checkLoggedIn).to be > 0
   

  end	
	
	
  it 'checks system users', severity: :critical do 

    @driver.find_element(link_text: 'System Users').click

  end		
	
	
    
  end #do describe


