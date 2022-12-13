module Trucks
  class SearchesController < ApplicationController
    def show
      trucks = Trucks::Search.call(params)

      render json: ::TruckSerializer.new(trucks).serializable_hash_data
    end
  end
end
