require 'spec_helper'

describe "Static Pages" do
  before do
    visit new_post_path
    fill_in 'post_title', with: "title 1"
    fill_in 'post_content', with: "content 1"
    click_button "Submit"
    visit new_post_path
    fill_in 'post_title', with: "title 2"
    fill_in 'post_content', with: "content 2"
    click_button "Submit"
  end
  subject { page }

  describe "at index page" do
    before { visit root_url }

    it { should have_content("content 1") }
    it { should_not have_content("content 2") }
  end
end