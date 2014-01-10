require 'spec_helper'

describe Post do
  before { @post = Post.new(title: "Test title", content: "Lorem ipsum.") }

  subject { @post }

  it { should respond_to(:title) }
  it { should respond_to(:content) }

  it { should be_valid }

  describe "when content is not present" do
    before { @post.content = "" }
    it { should_not be_valid }
  end

  describe "when title is not present" do
    before { @post.title = "" }
    it { should be_valid }
  end

  describe "when title is too long" do
    before { @post.title = "a" * 141 }
    it { should_not be_valid }
  end
end
