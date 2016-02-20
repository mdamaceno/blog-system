# == Schema Information
#
# Table name: blog_tags
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

module Blog
  class TagTest < ActiveSupport::TestCase
    test 'should not save without name' do
      tag = Tag.new(name: nil)
      refute tag.save
    end
  end
end
