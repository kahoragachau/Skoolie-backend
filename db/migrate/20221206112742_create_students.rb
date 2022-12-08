class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :school_id
      t.integer :user_id

      t.timestamps
    end
  end
end
