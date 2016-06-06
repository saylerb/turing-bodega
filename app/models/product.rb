class Product < ActiveRecord::Base

  has_many :votes
  has_many :users, through: :votes

  def score
    votes.count
  end
end
