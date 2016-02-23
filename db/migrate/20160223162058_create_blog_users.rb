class CreateBlogUsers < ActiveRecord::Migration
  def change
    create_table :blog_users do |t|
      t.string :firstname
      t.string :lastname
      t.string :slug, null: false
      t.string :email, null: false
      t.string :password
      t.string :role, default: 'guest'
      t.boolean :status, default: false
      t.boolean :remember, default: false
      t.datetime :remember_at
      t.datetime :last_login_at
      t.datetime :last_logout_at
      t.datetime :reset_password_at
      t.boolean :confirmed, default: false
      t.datetime :confirmed_at
      t.string :authentication_token

      t.timestamps null: false
    end
    add_index :blog_users, :email, unique: true
    add_index :blog_users, :slug, unique: true
  end
end
