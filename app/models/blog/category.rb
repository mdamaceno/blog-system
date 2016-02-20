module Blog
  class Category < ActiveRecord::Base
    extend FriendlyId
    friendly_id :name, use: :slugged

    # Validations
    validates :name, presence: true
  end
end
