require 'spec_helper'

describe User do
  it "should create a user with valid attributes" do
    params = { email: 'john.doe@example.com', phone_number: "+1(555)555-5555",
               password: "password", password_confirmation: "password"}
    User.create!(params)
  end

  it "should not create a user with missing attributes" do
    params_without_email = { phone_number: "+1(555)555-5555",
                             password: "password",
                             password_confirmation: "password"}
    params_without_phone = { email: "john.doe@example.com",
                             password: "password",
                             password_confirmation: "password"}
    params_without_pass = { email: "john.doe@example.com",
                            phone_number: "+1(555)555-5555",
                            password_confirmation: "password"}

    User.create(params_without_email).valid?.should be_false
    User.create(params_without_phone).valid?.should be_false
    User.create(params_without_pass).valid?.should be_false
  end

  it "should not create a user with an invalid email address format" do
    params = { email: 'john.example.com', phone_number: "+1(555)555-5555",
               password: "password", password_confirmation: "password"}
    User.create(params).valid?.should be_false
  end

  it "should not create a user with an invalid US phone number" do
    params_with_short_num = { email: 'john.example.com',
                              phone_number: "55555555",
                              password: "password",
                              password_confirmation: "password"}
    params_with_long_num = { email: 'john.example.com',
                             phone_number: "+1234567891011",
                             password: "password",
                             password_confirmation: "password"}
    params_with_international_num = { email: 'john.example.com',
                                      phone_number: "+9(555)555-5555",
                                      password: "password",
                                      password_confirmation: "password"}

    User.create(params_with_short_num).valid?.should be_false
    User.create(params_with_long_num).valid?.should be_false
    User.create(params_with_international_num).valid?.should be_false
  end

  it "should not create a user with a duplicate email" do
    params = { email: 'john.doe@example.com', phone_number: "+1(555)555-5555",
               password: "password", password_confirmation: "password"}
    User.create!(params)

    params = { email: 'john.doe@example.com', phone_number: "+1(666)666-6666",
               password: "password", password_confirmation: "password"}
    User.create(params).valid?.should be_false
  end

  it "should not create a user with a duplicate phone number" do
    params = { email: 'john.doe@example.com', phone_number: "+1(555)555-5555",
               password: "password", password_confirmation: "password"}
    User.create!(params)

    params = { email: 'jane.doe@example.com', phone_number: "+15555555555",
               password: "password", password_confirmation: "password"}
    User.create(params).valid?.should be_false
  end
end
