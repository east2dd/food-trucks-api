class TruckSerializer < BaseSerializer
  include FastJsonapi::ObjectSerializer
  attributes :locationid,
    :facilitytype,
    :address,
    :latitude,
    :longitude,
    :fooditems
end
