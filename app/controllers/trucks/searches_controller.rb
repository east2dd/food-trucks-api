module Trucks
  class SearchesController < ApplicationController
    def show
      trucks = Trucks::Search.call(search_params)

      render json: ::TruckSerializer.new(trucks).serializable_hash_data
    end

    private

    def search_params
      params
        .permit(
          :latitude,
          :longitude,
          :radius,
          :facilitytype,
          :fooditems
        )
        .compact
        .to_h
    end
  end
end
