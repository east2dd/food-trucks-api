module Trucks
  class Search
    attr :params

    def initialize(params)
      @params = params
    end

    def self.call(params)
      service = new(params)

      service.call
    end

    def call
      trucks = Truck.where(status: 'APPROVED')
      trucks = filter_by_fooditems(trucks)
      trucks = filter_by_geo_radius(trucks)
      trucks = filter_by_facilitytype(trucks)
      trucks.order(approved: :desc)
    end

    def filter_by_geo_radius(scope)
      return scope if params[:radius].blank?

      coordinates = [params[:latitude].to_f, params[:longitude].to_f]
      radius = params[:radius].to_f

      coordinates_min, coordinates_max = BoundingBoxCalculator.call(coordinates, radius)

      # Truck.nearby([latitude, longitude], radius)
      scope.where(
        latitude: coordinates_min[0]..coordinates_max[0],
        longitude: coordinates_min[1]..coordinates_max[1]
      )
    end

    def filter_by_fooditems(scope)
      return scope if params[:fooditems].blank?

      scope.where("fooditems like ?", "%#{params[:fooditems]}%")
    end

    def filter_by_facilitytype(scope)
      return scope if params[:facilitytype].blank?

      scope.where(facilitytype: params[:facilitytype])
    end
  end
end
