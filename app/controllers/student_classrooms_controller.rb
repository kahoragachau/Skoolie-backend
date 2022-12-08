class StudentClassroomsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    #GET
    def index
       student_class = StudentClass.all
       rander json: student_class
    end
    def show
        student_class = StudentClass(params[:id])

        render json: student_class
    end
    def create
        student_class = StudentClass(student_class_params)
        render json: student_class, status: :created
    end

   #PATCH
   def update
       student_class = StudentClass.find(params[:id])
       student_class.update(student_class_params)
       render json: student_class
   end

   #DELETE
   def destroy
       student_class = StudentClass.find(params[:id])
       student_class.destroy
       head :no_content
   end

   private

   def student_class_params
       params.permit(:name, :school_id, :educator_id, student_id )
   end

   def render_not_found_response
       render json: {error: 'student_class not found'}, status: :not_found
    end
end
