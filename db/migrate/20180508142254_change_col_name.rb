class ChangeColName < ActiveRecord::Migration[5.1]
  def change
  	rename_column :features, :type, :feature_type

  end
end
