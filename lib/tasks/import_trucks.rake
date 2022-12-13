require 'csv'

namespace :data do
  desc 'Import data from csv file'
  task import_trucks: :environment do
    source_file_path = Rails.root.join('data', 'trucks.csv')

    Truck.delete_all
    CSV.foreach(source_file_path, headers: false) do |row|
      truck_hash = convert_csv_row_to_hash(row)

      truck = Truck.new(truck_hash)
      truck.save
    end
  end

  def convert_csv_row_to_hash(row)
    hash = {}

    csv_columns.each_with_index do |column, index|
      continue if column.blank?

      hash[column] = row[index]
    end

    hash
  end

  def csv_columns
    [
      :locationid,
      :applicant,
      :facilitytype,
      :cnn,
      :locationdescription,
      :address,
      :blocklott,
      :block,
      :lot,
      :permit,
      :status,
      :fooditems,
      :x,
      :y,
      :latitude,
      :longitude,
      :schedule,
      :dayshours,
      :noisent,
      :approved,
      :received,
      :priorpermit,
      :expirationdate,
      :location,
    ]
  end
end
