class AddAvatarsToFeatures < ActiveRecord::Migration[5.1]
  def change
    add_column :features, :avatars, :string
  end
end
