class TrucksController < ApplicationController
  def index
    trucks = Truck.where(status: 'APPROVED')

    render json: ::TruckSerializer.new(trucks).serializable_hash_data
  end
end
