class CreateSessionHolders < ActiveRecord::Migration
  def change
    create_table :session_holders do |t|
      t.integer :user_id
      t.string :session_token
      t.text :environment

      t.timestamps
    end
    add_index :session_holders, :user_id
    add_index :session_holders, :session_token
  end
end
