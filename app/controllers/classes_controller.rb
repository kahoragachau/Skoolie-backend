class ClassesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    #GET
    def index
       class = Class.all
       rander json: class
    end
    def show
        class = Class.find(params[:id])

        render json: class
    end
    def create
        class = Class.create(class_params)
        render json: class, status: :created
    end

   #PATCH
   def update
       class = Class.find(params[:id])
       class.update(class_params)
       render json: class
   end

   #DELETE
   def destroy
       class = Class.find(params[:id])
       class.destroy
       head :no_content
   end

   private

   def class_params
       params.permit(:name, :school_id, :educator_id, student_id )
   end

   def render_not_found_response
       render json: {error: 'class not found'}, status: :not_found
    end
   
end
