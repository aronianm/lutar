class TrainorUserConnection < ActiveRecord::Migration[7.0]
  def change
    create_table :trainor_users do |t|
      t.integer :user_id
      t.integer :trainor_id
      t.timestamps null: false
    end

    add_index :trainor_users, [:user_id, :trainor_id], unique: true
    add_foreign_key :trainor_users, :users, column: :user_id
    add_foreign_key :trainor_users, :trainors, column: :trainor_id
  end
end
