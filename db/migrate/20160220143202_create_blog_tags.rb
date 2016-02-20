class CreateBlogTags < ActiveRecord::Migration
  def change
    create_table :blog_tags do |t|
      t.string :name, null: false
      t.string :slug

      t.timestamps null: false
    end
  end
end
