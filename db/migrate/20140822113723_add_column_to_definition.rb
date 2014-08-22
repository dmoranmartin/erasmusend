class AddColumnToDefinition < ActiveRecord::Migration
  def change
  	add_column :definitions, :categoryx, :string
  end
end
