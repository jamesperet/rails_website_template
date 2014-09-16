class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.string :slug
      t.text :content
      t.boolean :published
      t.references :author, index: true

      t.timestamps
    end
    add_index :blog_posts, :slug, unique: true
  end
end
