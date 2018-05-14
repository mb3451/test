class ChangeTablenameBug < ActiveRecord::Migration[5.1]
  def change
  	rename_table :bugs, :features
  end
end
