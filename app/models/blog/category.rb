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

module Blog
  class Category < ActiveRecord::Base
    extend FriendlyId
    friendly_id :name, use: :slugged

    # Validations
    validates :name, presence: true
  end
end
