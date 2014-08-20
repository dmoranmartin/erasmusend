class Definition < ActiveRecord::Base
  belongs_to :word
  has_many :votes
end