require 'spec_helper'

describe "your_site app - " do
  describe "URL /" do
     it "Checking for text 'Welcome aboard' somewhere in the page" do
      visit '/'
      page.should have_content('Welcome aboard')
     end
     
     it "Checking for text 'Getting started' somewhere in the page" do
      visit '/'
      page.should have_content('Getting started')
     end
  end
end
