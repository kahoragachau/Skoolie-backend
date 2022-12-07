class CreateStudentClassrooms < ActiveRecord::Migration[7.0]
  def change
    create_table :student_classrooms do |t|
      t.integer :student_id
      t.integer :classroom_id
      t.integer :school_id

      t.timestamps
    end
  end
end
