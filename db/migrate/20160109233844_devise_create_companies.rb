class DeviseCreateCompanies < ActiveRecord::Migration
  def change
    create_table(:companies) do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.attachment :logo
      t.string :name
      t.string :shortcut
      t.integer :activity_category_id
      t.integer :juridical_status_id
      t.string :commercial_id
      t.integer :number_of_employee_id
      t.float :revenue
      t.string :telephone
      t.string :fax
      t.string :website
      t.string :email
      t.string :address
      t.integer :country
      t.string :city
      t.text :description


      t.timestamps
    end

    add_index :companies, :email,                unique: true
    add_index :companies, :reset_password_token, unique: true
    # add_index :companies, :confirmation_token,   unique: true
    # add_index :companies, :unlock_token,         unique: true
  end
end
