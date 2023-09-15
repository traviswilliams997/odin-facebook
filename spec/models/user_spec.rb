require 'rails_helper'

RSpec.describe User, type: :model do


  it 'has a password' do 
    user = build(:user, first_name: "Jacob", last_name: "Jones")
    expect(user).to_not be_valid
    user.password = "password"
    expect(user).to be_valid
 end

  it 'has a email' do 
    user = build(:user, first_name: "Kevin", last_name: "Baker", password: "password", email: nil, )
    expect(user).to_not be_valid
    user.email = "kevin@gmail.com"
    expect(user).to be_valid
  end

  it 'has a first name' do 
    user = build(:user, last_name: "Smith", password: "password")
    expect(user).to_not be_valid
    user.first_name = "Tom"
    expect(user).to be_valid
    
  end

  it 's first name must be atleast 2 characters' do
    user = build(:user, first_name: "P", last_name: "Black", password: "password")
    expect(user).to_not be_valid
    user.first_name = "Paul"
    expect(user).to be_valid
  end 

  it 'has a last name' do 
    user = build(:user, first_name: "Sarah", password: "password")
    expect(user).to_not be_valid
    user.last_name = "Williams"
    expect(user).to be_valid
    
  end

  it 's last name must be atleast 2 characters' do
    user = build(:user, first_name: "Pauline", last_name: "B", password: "password")
    expect(user).to_not be_valid
    user.last_name = "Paul"
    expect(user).to be_valid
  end 
end
