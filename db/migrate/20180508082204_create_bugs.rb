class CreateBugs < ActiveRecord::Migration[5.1]
  def change
    create_table :bugs do |t|
    	t.string :title
    	t.string :description
    	t.string :img
    	t.string :type
      t.string :status
    	t.belongs_to :project, index: true
    	t.references :creator
      t.references :developer


   		t.timestamps

    end
  end
end
