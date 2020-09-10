class CreateCustomers < ActiveRecord::Migration[4.2]

  def change
    create_table :customers do |t|
      t.string :name
      t.string :drinks
      t.boolean :is_over_21
    end
  end

end