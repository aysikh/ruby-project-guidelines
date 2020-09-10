class CreateDrinks < ActiveRecord::Migration[4.2]

  def change
    create_table :drinks do |t|
      t.string :name
      t.float :price
      t.string :liquor
      t.string :ingredients
    end
  end

end