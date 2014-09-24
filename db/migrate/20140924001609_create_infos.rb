class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.string :website_name
      t.string :tagline
      t.string :logo
      t.string :contact_email
      t.string :default_language

      t.timestamps
    end
  end
end
