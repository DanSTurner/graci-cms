require 'spec_helper'

describe Post do
  before { @user = User.new(email: "test@test.com", password: "password", password_confirmation: "password") }

  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:admin) }

  it { should be_valid }
end