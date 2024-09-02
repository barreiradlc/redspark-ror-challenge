class CreateAdresses < ActiveRecord::Migration[7.2]
  def change
    create_table :adresses do |t|
      t.string :street
      t.string :number
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :zip_code

      t.timestamps
    end
  end

  def down
    drop_table :adresses 
  end
end
