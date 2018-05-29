require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it 'should validate the name' do
  	user = User.new
  	expect(user.valid?).to be false
  	expect(user.errors[:name]).to eq ["can't be blank"]
  end

  it 'should be unique' do
  	user1 = User.create(name: "qqq", password: "qqq")

  	user2 = User.new(name: "qqq")

  	expect(user2.valid?).to be false
  	expect(user2.errors[:name]).to eq ["has already been taken"]
  end
end


