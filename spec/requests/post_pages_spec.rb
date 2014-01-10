require 'spec_helper'

describe "Post Pages" do
  before {}
  subject { page }

  describe "index" do
    before { visit posts_path }

    it { should have_content("All Posts") }
  end

  describe "post creation" do
    before { visit new_post_path }

    describe "when submitting" do
      describe "invalid title" do
        before do
          fill_in 'post_title', with: "a" * 141
          fill_in 'post_content', with: "valid"
        end

        it "should not create a post" do
          expect { click_button "Create Post" }.not_to change(Post, :count)
        end
      end
      describe "invalid content" do
        before { fill_in 'post_content', with: "" }

        it "should not create a post" do
          expect { click_button "Create Post" }.not_to change(Post, :count)
        end
      end
    end
  end
end
