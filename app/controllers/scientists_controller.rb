class ScientistsController < ApplicationController

   def index 
      render json: Scientist.all, status: :ok
   end

   def show
      scientist = Scientist.find(params[:id])
      render json: scientist, serializer: ScientistWithPlanetsSerializer
   end

   def create 
      render json: Scientist.create!(scientist_params), status: :created
   end

   def update
      scientist = Scientist.find(params[:id])
      scientist.update!(scientist_params)
      render json: scientist, status: :accepted
   end

   def destroy
      scientist = Scientist.find(params[:id])
      scientist.destroy
      head :no_content
   end

   private

   def scientist_params
      params.permit(:name, :field_of_study, :avatar)
   end

end
