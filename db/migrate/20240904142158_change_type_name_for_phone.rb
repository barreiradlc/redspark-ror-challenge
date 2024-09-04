class ChangeTypeNameForPhone < ActiveRecord::Migration[7.2]
  def change
    remove_column :phones, :type
    add_column :phones, :contact_type, :integer
  end
  
  def down
    add_column :phones, :type, :integer
    remove_column :phones, :contact_type
  end
end
