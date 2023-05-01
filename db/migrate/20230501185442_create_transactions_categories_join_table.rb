class CreateTransactionsCategoriesJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions_categories, id: false do |t|
      t.belongs_to :transaction
      t.belongs_to :category
    end
  end
end
