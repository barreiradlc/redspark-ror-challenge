class AddReferencesToProponent < ActiveRecord::Migration[7.2]
  def change
    change_table :phones do |t|
      t.belongs_to :proponent
    end

    change_table :adresses do |t|
      t.belongs_to :proponent
    end
  end

  def down 
    change_table :phones do |t|
      t.remove_references :proponent
    end

    change_table :adresses do |t|
      t.remove_references :proponent
    end
  end
end
