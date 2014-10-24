class CreateContactMessages < ActiveRecord::Migration
  def change
    create_table :contact_messages do |t|
      t.string :title
      t.string :email
      t.text :content
      t.boolean :unread
      t.references :user, index: true

      t.timestamps
    end
  end
end
