class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :title

      t.timestamps null: false
    end

    add_reference :rooms, :creator, references: :users, index: true
    add_foreign_key :rooms, :users, column: :creator_id, on_delete: :cascade
  end
end
