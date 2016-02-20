module Blog
  class Tag < ActiveRecord::Base
    # Validations
    validates :name, presence: true
  end
end
