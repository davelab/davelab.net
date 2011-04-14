class CreateWorks < ActiveRecord::Migration
  def self.up
    create_table :works do |t|
      t.integer :category_id
      t.string :name
      t.text :description
      t.string :link
      t.date :realized_at

      t.timestamps
    end
  end

  def self.down
    drop_table :works
  end
end
