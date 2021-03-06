class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.integer :author_id, index: true
      t.timestamps null: false
    end

    add_foreign_key :posts, :users, column: :author_id, on_delete: :cascade
  end
end
