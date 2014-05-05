require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

<<<<<<< HEAD
    it "should have the base title" do
      visit '/static_pages/home'
      expect(page).to have_title("Jumanji Cinema")
    end

    it "should not have a custom page title" do
      visit '/static_pages/home'
      expect(page).not_to have_title('| Home')
    end
=======
    it { should have_content('Jumanji') }
    it { should have_title(full_title('')) }
    it { should_not have_title('| Home') }
>>>>>>> filling-in-layout
  end

  describe "Help page" do
    before { visit help_path }

<<<<<<< HEAD
    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end

    it "should have the title 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_title("Jumanji Cinema | Help")
    end
=======
    it { should have_content('Help') }
    it { should have_title(full_title('Help')) }
>>>>>>> filling-in-layout
  end

  describe "About page" do
    before { visit about_path }

    it { should have_content('About') }
    it { should have_title(full_title('About Us')) }
  end

  describe "Contact page" do
    before { visit contact_path }

<<<<<<< HEAD
    it "should have the title 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_title("Jumanji Cinema | About Us")
    end
=======
    it { should have_content('Contact') }
    it { should have_title(full_title('Contact')) }
>>>>>>> filling-in-layout
  end
end