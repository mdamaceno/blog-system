# == Schema Information
#
# Table name: blog_categories
#
#  id          :integer          not null, primary key
#  name        :string
#  slug        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

module Blog
  class CategoryTest < ActiveSupport::TestCase
    test 'should not save without name' do
      category = Blog::Category.new(name: nil, description: 'abc')
      refute category.save
    end
  end
end
