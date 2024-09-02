class CreateProponents < ActiveRecord::Migration[7.2]
  def change
    create_table :proponents do |t|
      t.string :name
      t.string :cpf
      t.date :birth_date
      t.references :adress, null: false, foreign_key: true
      t.references :phones, null: false, foreign_key: true
      t.integer :wage
      t.integer :inss_discount

      t.timestamps
    end

    add_column :phones, :proponent_id, :integer
    add_index  :phones, :proponent_id
    
    add_column :adresses, :proponent_id, :integer
    add_index :adresses, :proponent_id, unique: true
  end
end
