class Spice < ApplicationRecord
    before_action :set_spice, only: [:update, :destroy]

    def index
      spices = Spice.all
      render json: spices
    end
  
    def create
      spice = Spice.new(spice_params)
      if spice.save
        render json: spice, status: :created
      else
        render json: { errors: spice.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def update
      if @spice.update(spice_params)
        render json: @spice
      else
        render json: { errors: @spice.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      @spice.destroy
    end
end
