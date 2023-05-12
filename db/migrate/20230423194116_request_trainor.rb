class RequestTrainor < ActiveRecord::Migration[7.0]
  def change
    create_table :request_trainors do |t|
      t.integer :user_id
      t.integer :trainor_id
      t.boolean :accept, default: nil
      t.timestamps null: false
    end

      add_index :request_trainors, [:user_id, :trainor_id], unique: true
    add_foreign_key :request_trainors, :users, column: :user_id
    add_foreign_key :request_trainors, :trainors, column: :trainor_id
  end
end
