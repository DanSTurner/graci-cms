require 'spec_helper'

describe "Comment" do
  before do
    @post = Post.new(title: "Test title", content: "Lorem ipsum.")
    @comment = @post.comments.build(content: "comment text")
  end

  subject { @comment }

  it { should respond_to(:content) }
  it { should respond_to(:post_id) }
end
