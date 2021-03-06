class AddConfirmableToDevise < ActiveRecord::Migration[6.0]
  def up
    add_column :users,  :confirmation_token, :string
    add_column :users,  :confirmed_at, :datetime
    add_column :users,  :confirmation_sent_at, :datetime
    # t.string   :unconfirmed_email # Only if using reconfirmable  
    add_index :users,   :confirmation_token, unique: true
    User.update_all confirmed_at: DateTime.now
  end

  def down
    remove_column :users, :confirmation_token, :confirmed_at, :confirmation_sent_at
  end
end
