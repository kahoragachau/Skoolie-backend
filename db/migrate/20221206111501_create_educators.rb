class CreateEducators < ActiveRecord::Migration[7.0]
  def change
    create_table :educators do |t|
      t.string :name
      t.integer :school_id

      t.timestamps
    end
  end
end
