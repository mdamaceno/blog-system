class CreateBlogTags < ActiveRecord::Migration
  def change
    create_table :blog_tags do |t|
      t.string :name, null: false
      t.string :slug

      t.timestamps null: false
    end
    add_index :blog_tags, :slug, unique: true
  end
end
