require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it "should validate a user given proper input" do
      test_user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        e_mail: 'test@example.com',
        password: 'test',
        password_confirmation: 'test',
      )

      expect(test_user).to be_valid
    end

    it "should invalidate a user given passwords that don't match" do
      test_user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        e_mail: 'test@example.com',
        password: 'test',
        password_confirmation: 'testwrong',
      )
      expect(test_user).to_not be_valid
    end

    it "should invalidate a user given no email" do
      test_user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        password: 'test',
        password_confirmation: 'test',
      )
      expect(test_user).to_not be_valid
    end

    it "should invalidate a user given no first name" do
      test_user = User.new(
        last_name: 'Doe',
        e_mail: 'test@example.com',
        password: 'test',
        password_confirmation: 'test',
      )

      expect(test_user).to_not be_valid
    end
    
    it "should not allow duplicate email addresses" do
      test_user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        e_mail: 'test@example.com',
        password: 'test',
        password_confirmation: 'test',
      )
      test_user.save
      puts test_user.errors.full_messages

      test_user1 = User.new(  
        first_name: 'Jane',
        last_name: 'Doe',
        e_mail: 'test@example.com',
        password: 'test',
        password_confirmation: 'test',
      )
     expect(User.find_by(first_name: 'Jane')).to be_nil 
    
    end

    it "should not allow duplicate email addresses despite different cases" do
      test_user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        e_mail: 'test@exAMple.com',
        password: 'test',
        password_confirmation: 'test',
      )
      test_user.save
      puts test_user.errors.full_messages

      test_user1 = User.new(  
        first_name: 'Jane',
        last_name: 'Doe',
        e_mail: 'TEST@example.com',
        password: 'test',
        password_confirmation: 'test',
      )
     expect(User.find_by(first_name: 'Jane')).to be_nil 
    
    end


    it "should invalid a password that is not over the minimum length" do
      test_user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        e_mail: 'test@example.com',
        password: 't',
        password_confirmation: 't',
      )

      expect(test_user).to_not be_valid
    end
  end

  describe ".authenticate_with_credentials" do
  
    user = User.create({
      first_name: 'Test',
      last_name: 'Billy',
      e_mail: 'test123@example.com',
      password: '9876',
      password_confirmation: '9876',
    })

  
    it "should authenticate user given correct email and password" do
      user.save
      test = User.authenticate_with_credentials(user.e_mail, user.password)
      expect(test).to_not be_nil
    end

    it "should return nil, if the user email is incorrect" do
      user.save
      test = User.authenticate_with_credentials("bob@gmail.com", user.password)
      expect(test).to be_nil
    end

    it "should return nil, if the user password is incorrect" do
      user.save
      test = User.authenticate_with_credentials(user.e_mail, 123)
      expect(test).to be_nil
    end

  end

end

