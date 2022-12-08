class OwnersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    #GET
    def index
       owner = Owner.all
       rander json:owner
    end
    def show
        owner = Owner.find(params[:id])

        render json: owner
    end
    def create
        owner = Owner.create(owner_params)
        render json: owner, status: :created
    end

   #PATCH
   def update
       owner = Owner.find(params[:id])
       owner.update(owner_params)
       render json: owner
   end

   #DELETE
   def destroy
       owner = Owner.find(params[:id])
       owner.destroy
       head :no_content
   end

   private

   def owner_params
       params.permit(:name, :school_id, :user_id )
   end

   def render_not_found_response
       render json: {error: 'owner not found'}, status: :not_found
    end
   

end
