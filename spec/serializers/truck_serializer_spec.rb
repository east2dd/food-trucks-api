require "rails_helper"

RSpec.describe TruckSerializer do
  let(:truck) { create(:truck) }

  describe "#serializable_hash" do
    it "has attributes hash" do
      expected_serialized_attributes = %i(
        locationid
        facilitytype
        address
        latitude
        longitude
        fooditems
      )

      serialized_attributes = TruckSerializer.new(truck).serializable_hash[:data][:attributes]

      expect(serialized_attributes.keys).to match_array expected_serialized_attributes
    end
  end
end
