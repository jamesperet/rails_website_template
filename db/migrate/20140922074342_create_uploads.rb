class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :title
      t.string :file
      t.text :desciption

      t.timestamps
    end
  end
end
