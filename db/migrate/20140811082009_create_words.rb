class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :name
      t.string :origin
      t.text :definition
      t.string :photo
      t.string :video
      t.text :example
      t.string :language
      t.string :category
      t.timestamps
    end
  end
end
