class AddLinkToInfos < ActiveRecord::Migration
  def change
    add_column :infos, :website_link, :string
  end
end
