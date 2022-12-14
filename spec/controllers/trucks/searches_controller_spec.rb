require "rails_helper"

describe Trucks::SearchesController do
  describe "show" do
    let(:params) do
      {
        facilitytype: "Truck",
      }
    end

    let!(:truck_1) do
      create(:truck, :approved, facilitytype: "Truck")
    end

    it "calls Truck::Search service with params" do
      expect(::Trucks::Search).to receive(:call).with(params)
      expect_any_instance_of(::TruckSerializer).to receive(:serializable_hash_data)

      response = get :show, params: params

      expect(response.response_code).to eq 200
    end

    it "returns serialized trucks" do
      response = get :show, params: params

      expect(response.response_code).to eq 200
      expect(response.parsed_body.count).to eq 1
      expect(response.parsed_body[0]["attributes"]["locationid"]).to eq truck_1.locationid
      expect(response.parsed_body[0]["attributes"]["facilitytype"]).to eq truck_1.facilitytype
      expect(response.parsed_body[0]["attributes"]["address"]).to eq truck_1.address
      expect(response.parsed_body[0]["attributes"]["latitude"]).to eq truck_1.latitude
      expect(response.parsed_body[0]["attributes"]["longitude"]).to eq truck_1.longitude
    end
  end
end
