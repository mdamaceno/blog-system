require 'test_helper'

module Blog
  class TagTest < ActiveSupport::TestCase
    test 'should not save without name' do
      tag = Tag.new(name: nil)
      refute tag.save
    end
  end
end
