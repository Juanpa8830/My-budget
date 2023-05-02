class CreateCategoriesMovementsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :categories_movements, id: false do |t|
      t.belongs_to :movement
      t.belongs_to :category
    end
  end
end
