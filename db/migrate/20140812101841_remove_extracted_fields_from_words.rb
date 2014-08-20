class RemoveExtractedFieldsFromWords < ActiveRecord::Migration
  def change
  	[:origin, :definition, :photo, :video, :example, :category].each do |field|
  		remove_column(:words, field)
  	end
  end
end
