class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    drop_table :users
    create_table :users do |t|
      t.string "username"
      t.string "password_digest"
      t.string "picture"
      t.timestamps
    end
  end
end
