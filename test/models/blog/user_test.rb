require 'test_helper'

module Blog
  class UserTest < ActiveSupport::TestCase
    test 'should not save without email' do
      user = User.new(attributes_for(:user, email: nil))
      refute user.save
    end

    test 'should not save if email already exists' do
      user1 = User.new(attributes_for(:user, email: 'user@example.com'))
      user1.save
      user2 = User.new(attributes_for(:user, email: 'user@example.com'))
      refute user2.save
    end
  end
end
