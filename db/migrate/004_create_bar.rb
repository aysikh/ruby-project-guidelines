class CreateBar < ActiveRecord::Migration[4.2]

  def change
    create_table :bar do |t|
      t.integer :customer_id
      t.integer :drink_id
    end
  end


end