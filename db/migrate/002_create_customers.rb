class CreateCustomers < ActiveRecord::Migration[4.2]

  def change
    create_table :customers do |t|
      t.string :name
      t.string :favorite_drink
      t.string :favorite_bartender
      t.boolean :is_over_21
      t.boolean :is_a_regular
    end
  end

end