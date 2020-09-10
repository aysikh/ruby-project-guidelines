class CreateBars < ActiveRecord::Migration[4.2]

  def change
    create_table :bars do |t|
      t.integer :customer_id
      t.integer :drinks_id
    end
  end

end

# bar 1 = drink_id, customer_id 
