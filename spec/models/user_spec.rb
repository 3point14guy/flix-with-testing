require 'rails_helper'

describe "A user" do
  it "requires a user name" do
    user = User.new(name: "")
    user.valid?

    expect(user.errors[:name].any?).to eq(true)
  end

  it "requires an email" do
    user = User.new(email: "")
    user.valid?

    expect(user.errors[:email].any?).to eq(true)
  end

  it "requires a password" do
    user = User.new(password: "")
    user.valid?

    expect(user.errors[:password].any?).to eq(true)
  end

  it "accepts properly formatted email addresses" do
    emails = %w[user@exmple.com first.last@example.com]
    emails.each do |email|
      user = User.new(email: email)
      user.valid?

      expect(user.errors[:email].any?).to eq(false)
    end
  end

  it "rejects improperly formed emails" do
    emails = %W[@ user@ @mail.com]
    emails.each do |email|
      user = User.new(email: email)
      user.valid?

      expect(user.errors[:email].any?).to eq(true)
    end
  end

  it "requires a unique, case insesnitive email" do
    user1 = User.create!(user_attributes)

    user2 = User.new(email: user1.email.upcase)
    user2.valid?
    expect(user2.errors[:email].first).to eq("has already been taken")
  end

  it "is valid with example attributes" do
    user = User.new(user_attributes)

    expect(user.valid?).to eq(true)
  end

  it "requires a password confirmation when a password is present" do
    user = User.new(password: "tendigitpass", password_confirmation: "")
    user.valid?

    expect(user.errors[:password_confirmation].any?).to eq(true)
  end

  it "requires password match password_confirmation" do
    user = User.new(password: "tendigitpass", password_confirmation: "10digitpass")
    user.valid?

    # expect(user.errors[:password_confirmation].any?).to eq(true)
    expect(user.errors[:password_confirmation].first).to eq("doesn't match Password")
  end

  it "requires a password and matching confirmation password when creating" do
    user = User.create!(user_attributes(password: "10digitpass", password_confirmation: "10digitpass"))

    expect(user.valid?).to eq(true)
  end

  it "does not require a password when updating" do
    user = User.create!(user_attributes)
    user.password = ""

    expect(user.valid?).to eq(true)
  end

  it "automatically encrypts the password into the password_digest attribute" do
    user = User.new(password: "10digitpass")

    expect(user.password_digest.present?).to eq(true)
  end

end
