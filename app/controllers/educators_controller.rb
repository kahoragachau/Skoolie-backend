class EducatorsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    #GET
    def index
       educator = Educator.all
       rander json: educator
    end
    def show
        educator = Educator.find(params[:id])

        render json: educator
    end
    def create
        educator = Educator.create(educator_params)
        render json: educator, status: :created
    end

   #PATCH
   def update
       educator = Educator.find(params[:id])
       educator.update(educator_params)
       render json: educator
   end

   #DELETE
   def destroy
       educator = Educator.find(params[:id])
       educator.destroy
       head :no_content
   end

   private

   def educator_params
       params.permit(:name, :school_id)
   end

   def render_not_found_response
       render json: {error: 'educator not found'}, status: :not_found
    end
end
