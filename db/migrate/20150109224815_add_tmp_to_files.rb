class AddTmpToFiles < ActiveRecord::Migration
  def change
    add_column :uploads, :file_tmp, :string
    add_column :uploads, :file_processing, :boolean, null: false, default: false
  end
end
