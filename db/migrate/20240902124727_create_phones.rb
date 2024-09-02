class CreatePhones < ActiveRecord::Migration[7.2]
  def change
    create_table :phones do |t|
      t.integer :type
      t.string :country_code
      t.string :state_code
      t.string :number

      t.timestamps
    end
  end

  def down
    drop_table :phones 
  end
end
