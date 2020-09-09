class CreateCustomers < ActiveRecord::Migration[4.2]

  def change
    create_table :customers do |t|
      t.string :name
      t.integer :favorite_drink_id
      t.integer :favorite_bartender_id
      t.boolean :is_over_21
      t.boolean :is_a_regular
    end
  end

end