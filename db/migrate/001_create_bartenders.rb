class CreateBartenders < ActiveRecord::Migration[4.2]

  def change
    create_table :bartenders do |t|
      t.string :name
      t.float :years_of_experience
    end
  end

end