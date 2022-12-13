module BoundingBoxCalculator
  extend self

  LON_DISTANCE_PER_DEGREE = 54.6 # miles
  LAT_DISTANCE_PER_DEGREE = 69.0 # miles

  def call(coordinates, distance)
    lat, lon = coordinates
    lat_delta = lat_distance_to_degree(distance)
    lon_delta = lon_distance_to_degree(distance)

    lat_range = range(lat, lat_delta)
    lon_range = range(lon, lon_delta)

    [
      [lat_range[0], lon_range[0]],
      [lat_range[1], lon_range[1]]
    ]
  end

  private

  def range(value, delta)
    [value - delta, value + delta]
  end

  def lat_distance_to_degree(distance)
    distance / LAT_DISTANCE_PER_DEGREE
  end

  def lon_distance_to_degree(distance)
    distance / LON_DISTANCE_PER_DEGREE
  end
end
