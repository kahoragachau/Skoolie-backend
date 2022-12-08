class StudentsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    #GET
    def index
       student = Student.all
       rander json:student
    end
    def show
        student = Student.find(params[:id])

        render json: student
    end
    def create
        sudent = Student.create(student_params)
        render json: student, status: :created
    end

   #PATCH
   def update
       student = Student.find(params[:id])
       student.update(student_params)
       render json: student
   end

   #DELETE
   def destroy
       student = Student.find(params[:id])
       student.destroy
       head :no_content
   end

   private

   def student_params
       params.permit(:name, :super_name )
   end

   def render_not_found_response
       render json: {error: 'student not found'}, status: :not_found
    end
   
end
