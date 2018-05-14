class CreateDescriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :descriptions do |t|
    	t.string :title	
      	t.text :description
      	t.integer :numbers

      	t.timestamps
    end
  end
end
