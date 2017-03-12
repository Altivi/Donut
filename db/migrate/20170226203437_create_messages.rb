class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.integer :room_id

      t.timestamps null: false
    end

    add_reference :messages, :author, references: :users, index: true
    add_reference :messages, :rooms, index: true
    add_foreign_key :messages, :users, column: :author_id, on_delete: :cascade
    add_foreign_key :messages, :rooms, on_delete: :cascade
  end
end
