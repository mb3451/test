class AddColToDescriptions < ActiveRecord::Migration[5.1]
  def change
  	add_column :descriptions, :status2, :text
  end
end
