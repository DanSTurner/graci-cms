require 'spec_helper'

describe "Comment Pages" do
  before do
    visit new_post_path
    fill_in 'post_title', with: "title"
    fill_in 'post_content', with: "lorem ipsum"
    click_button "Create Post"
    click_link "title"
  end
  subject { page }

  # describe ""
end