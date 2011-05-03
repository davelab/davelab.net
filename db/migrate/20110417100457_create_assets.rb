class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.string :type
      t.integer :assetable_id
      t.string :assetable_type
      t.string :attachment_file_name
      t.string :attachment_content_type
      t.integer :attachement_file_size
      t.date :attachment_uploaded_at

      t.timestamps
    end
  end

  def self.down
    drop_table :assets
  end
end
