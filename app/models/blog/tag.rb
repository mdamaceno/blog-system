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

module Blog
  class Tag < ActiveRecord::Base
    extend FriendlyId
    friendly_id :name, use: :slugged
    
    # Validations
    validates :name, presence: true
  end
end
