class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.timestamps
    end

    create_table :banks do |t|
      t.string :name
      t.timestamps
    end

    add_column :expenses, :category_id, :integer
    add_column :expenses, :bank_id, :integer
    remove_column :expenses, :category
    remove_column :expenses, :bank_name
  end
end
