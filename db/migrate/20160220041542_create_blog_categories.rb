class CreateBlogCategories < ActiveRecord::Migration
  def change
    create_table :blog_categories do |t|
      t.string :name
      t.string :slug
      t.text :description

      t.timestamps null: false
    end
  end
end
