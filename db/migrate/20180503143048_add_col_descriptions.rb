class AddColDescriptions < ActiveRecord::Migration[5.1]
  def change
  	add_column :descriptions, :status, :text
  end
end
