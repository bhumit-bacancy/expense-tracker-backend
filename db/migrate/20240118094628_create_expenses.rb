class CreateExpenses < ActiveRecord::Migration[7.1]
  def change
    create_table :expenses do |t|
      t.text :description
      t.integer :category
      t.date :date
      t.integer :transaction_type
      t.string :bank_name
      t.float :amount
      t.integer :user_id
      t.timestamps
    end
  end
end
