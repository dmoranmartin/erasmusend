class CreateDefinitions < ActiveRecord::Migration
  def change
    
    create_table :definitions do |t|
      t.references :word, index: true
      t.text :text
      t.string :video
      t.string :origin
      t.integer :category
      t.text :example

      t.timestamps
    end
  end
end
