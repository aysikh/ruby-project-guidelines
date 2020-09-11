class CreateCustomers < ActiveRecord::Migration[4.2]

  def change
    create_table :customers do |t|
      t.string :name
      t.string :drink
      t.integer :age
    end
  end

end