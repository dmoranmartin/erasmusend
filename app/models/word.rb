class Word < ActiveRecord::Base

	validates :name, :language, presence: true
	has_many :definitions
	accepts_nested_attributes_for :definitions

end

