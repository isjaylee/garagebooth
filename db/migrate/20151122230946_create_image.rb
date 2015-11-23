class CreateImage < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image_uid
      t.string :image_name
      t.string :imageable_id
      t.string :imageable_type
      t.timestamps
    end
  end
end
