class AddLinkToInfos < ActiveRecord::Migration
  def change
    add_column :infos, :website_link, :string
    add_column :infos, :server_email, :string
  end
end
