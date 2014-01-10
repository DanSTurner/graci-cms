require 'spec_helper'

describe "Post Pages" do
  subject { page }

  describe "post creation" do
    before { visit new_post_path }

    describe "when submitting" do
      describe "valid information" do
        before do
          visit new_post_path
          fill_in 'post_title', with: "title"
          fill_in 'post_content', with: "lorem ipsum"
          click_button "Create Post"
          visit root_path
        end

        it { should have_content("title") }
        it { should have_content("lorem ipsum") }

        describe "then editing" do
          before { click_link "edit" }
          it { should have_content("Edit Post") }

          describe "then updating" do
            before do
              fill_in "Content", with: "updated content"
              click_button "Save changes"
            end
            it { should have_content("updated content")}
          end
        end
      end

      describe "invalid title" do
        describe "due to length" do
          before do
            fill_in 'post_title', with: "a" * 141
            fill_in 'post_content', with: "valid"
          end

          it "should not create a post" do
            expect { click_button "Create Post" }.not_to change(Post, :count)
          end
        end

        describe "due to duplication" do
          before do
            fill_in 'post_title', with: "same title"
            fill_in 'post_content', with: "valid"
            click_button 'Create Post'
            visit new_post_path
            fill_in 'post_title', with: "same title"
            fill_in 'post_content', with: "valid"
          end

          it "should not create a post" do
            expect { click_button "Create Post" }.not_to change(Post, :count)
          end
        end
      end
      describe "invalid content" do
        before do
          fill_in 'post_content', with: "valid"
          fill_in 'post_content', with: ""
        end

        it "should not create a post" do
          expect { click_button "Create Post" }.not_to change(Post, :count)
        end
      end
    end
  end
end
