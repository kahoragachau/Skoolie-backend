class CreateStudentAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :student_attendances do |t|
      t.integer :student_id
      t.integer :classroom_id
      t.integer :school_id
      t.string :attendance

      t.timestamps
    end
  end
end
