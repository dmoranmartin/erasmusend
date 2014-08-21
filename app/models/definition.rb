class Definition < ActiveRecord::Base
  belongs_to :word
  has_many :votes
  has_many :negativevotes
end