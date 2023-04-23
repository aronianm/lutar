# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :trainors do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      # info of trainor
      t.string :fname
      t.string :lname
      t.string :city
      t.string :state
      t.string :zipcode
      # years of experience
      t.integer :experience

      t.decimal :monthly_price
      t.decimal :session_price

      # validation for being a trainor
      t.boolean :validated

      t.timestamps null: false
    end
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      # info of users
      t.string :fname
      t.string :lname
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :level

      t.timestamps null: false
    end
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true

    add_index :trainors, :email,                unique: true
    add_index :trainors, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
