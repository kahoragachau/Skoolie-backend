class StudentAttendancesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    #GET
    def index
       student_attendance = StudentAttendance.all
       rander json: student_attendance
    end
    def show
        student_attendance = StudentAttendance.find(params[:id])

        render json: student_attendance
    end
    def create
        student_attendance = StudentAttendance.create(student_attendance_params)
        render json: student_attendance, status: :created
    end

   #PATCH
   def update
       student_attendance = StudentAttendance.find(params[:id])
       student_attendance.update(student_attendance_params)
       render json: student_attendance
   end

   #DELETE
   def destroy
       student_attendance = StudentAttendance.find(params[:id])
       student_attendance.destroy
       head :no_content
   end

   private

   def student_attendance_params
       params.permit(:attendance, :student_id, :classroom_id, :school_id)
    end

   def render_not_found_response
       render json: {error: 'student_attendance not found'}, status: :not_found
    end
   
end
