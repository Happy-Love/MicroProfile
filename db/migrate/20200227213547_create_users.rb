class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, default: ""
      t.string :firstname
      t.string :lastname

      t.timestamps
    end
  end
end
