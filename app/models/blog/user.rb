module Blog
  class User < ActiveRecord::Base
    extend FriendlyId
    friendly_id :slug_candidates, use: :slugged

    # Validations
    validates :email, presence: true, uniqueness: true

    def slug_candidates
      [
        [:firstname, :lastname]
      ]
    end
  end
end
