require 'test_helper'

module Blog
  class CategoryTest < ActiveSupport::TestCase
    test 'should not save without name' do
      category = Blog::Category.new(name: nil, description: 'abc')
      refute category.save
    end
  end
end
