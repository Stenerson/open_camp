require 'spec_helper'

describe User do 

	#subject {@user}


  it { should have_many :tasks }


  describe "when user name is already taken" do
  	a = User.create(email:"1234@example.com", password:"111111111", password_confirmation: "111111111")
  	b = User.new(email:"1234@example.com", password:"111111111", password_confirmation: "111111111")
    
    (b.valid?).should_not == true
  end

end



