class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.integer :account_id
      t.string :description
      t.string :itemno
      t.date :date
      t.boolean :fee
      t.boolean :cleared
      t.float :amount
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
