class CreateNegativevotes < ActiveRecord::Migration
  def change
    create_table :negativevotes do |t|

      t.timestamps
    end
  end
end
