class AddMaintenanceToInfos < ActiveRecord::Migration
  def change
    add_column :infos, :maintenance_mode, :boolean
    add_column :infos, :maintenance_title, :string
    add_column :infos, :maintenance_message, :text
  end
end
