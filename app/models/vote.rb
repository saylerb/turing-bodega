class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :user, uniqueness: { scope: :product }
  validates :product, uniqueness: { scope: :user }
end
