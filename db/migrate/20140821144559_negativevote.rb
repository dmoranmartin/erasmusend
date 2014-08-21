class Negativevote < ActiveRecord::Migration
  def change
  	add_column :negativevotes, :definition_id, :integer
  end
end
