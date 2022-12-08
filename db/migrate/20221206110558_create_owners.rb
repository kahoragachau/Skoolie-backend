class CreateOwners < ActiveRecord::Migration[7.0]
  def change
    create_table :owners do |t|
      t.string :name
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :school_id

      t.timestamps
    end
  end
end
