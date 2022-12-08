class SchoolsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    #GET
    def index
       school = School.all
       rander json: school
    end
    def show
        school = School.find(params[:id])

        render json: school
    end
    def create
        school = School.create(school_params)
        render json: school, status: :created
    end

   #PATCH
   def update
       school = Sc.find(params[:id])
       school.update(school_params)
       render json: school
   end

   #DELETE
   def destroy
       school = School.find(params[:id])
       school.destroy
       head :no_content
   end

   private

   def school_params
       params.permit(:name, :owner_id )
   end

   def render_not_found_response
       render json: {error: 'school not found'}, status: :not_found
    end
end
