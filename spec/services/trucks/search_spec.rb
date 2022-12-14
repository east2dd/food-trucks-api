require "rails_helper"

RSpec.describe Trucks::Search, type: :service do
  subject { described_class }

  describe ".call" do
    context "when radius is present in params" do
      let(:radius) { 5 }
      let(:coordinates) { [0.5, 0.5] }
      let(:bounding_box) { [[0.0, 0.0], [1.0, 1.0]] }
      let(:params) do
        {
          radius: radius,
          latitude: coordinates[0],
          longitude: coordinates[1],
        }
      end

      let!(:truck_1) do
        create(
          :truck,
          :approved,
          latitude: 0.1,
          longitude: coordinates[1],
        )
      end

      let!(:truck_2) do
        create(
          :truck,
          :approved,
          latitude: 1.1,
          longitude: coordinates[1],
        )
      end

      let!(:truck_3) do
        create(
          :truck,
          :approved,
          latitude: coordinates[0],
          longitude: 1.1,
        )
      end

      let!(:truck_4) do
        create(
          :truck,
          :approved,
          latitude: coordinates[0],
          longitude: 0.1,
        )
      end

      let!(:truck_5) do
        create(
          :truck,
          latitude: coordinates[0],
          longitude: 0.1,
          status: 'REQUESTED',
        )
      end

      before do
        allow(::BoundingBoxCalculator).to receive(:call).and_return(bounding_box)
      end

      it "returns approved trucks in bounding box" do
        expect(::BoundingBoxCalculator).to receive(:call).with(coordinates, radius)

        trucks = subject.call(params)
        expect(trucks.count).to eq 2
        expect(trucks).to match_array([truck_1, truck_4])
      end
    end

    context "when fooditems is present in params" do
      let(:params) do
        {
          fooditems: "taco",
        }
      end

      let!(:truck_1) do
        create(
          :truck,
          :approved,
          fooditems: "soda: taco:",
        )
      end

      let!(:truck_2) do
        create(
          :truck,
          :approved,
          fooditems: "taco: salad:",
        )
      end

      let!(:truck_3) do
        create(
          :truck,
          :approved,
          fooditems: "soda:",
        )
      end

      it "returns trucks by containing fooditems" do
        trucks = subject.call(params)

        expect(trucks.count).to eq 2
        expect(trucks).to match_array([truck_1, truck_2])
      end
    end

    context "when facilitytype is present in params" do
      let(:params) do
        {
          facilitytype: "Truck",
        }
      end

      let!(:truck_1) do
        create(
          :truck,
          :approved,
          facilitytype: "Truck",
        )
      end

      let!(:truck_2) do
        create(
          :truck,
          :approved,
          facilitytype: "Truck",
        )
      end

      let!(:truck_3) do
        create(
          :truck,
          :approved,
          facilitytype: "Push Cart",
        )
      end

      it "returns trucks by facilitytype" do
        trucks = subject.call(params)

        expect(trucks.count).to eq 2
        expect(trucks).to match_array([truck_1, truck_2])
      end
    end
  end
end
