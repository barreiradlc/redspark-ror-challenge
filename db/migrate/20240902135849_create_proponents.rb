class CreateProponents < ActiveRecord::Migration[7.2]
  def change
    create_table :proponents do |t|
      t.string :name
      t.string :cpf
      t.date :birth_date
      t.integer :wage
      t.integer :inss_discount

      t.timestamps
    end
  end

  def down
    drop_table :proponents
  end
end
