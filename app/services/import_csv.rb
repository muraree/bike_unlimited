require 'csv'
class ImportCsv
  attr_reader :file

  def initialize(file)
    @file = file
  end

  def run
    CSV.foreach(file, headers:true) do |row|
      rider_data = save_rider_data(row)
      GenerateUserPdf.new(rider_data).run
    end
  end

  private
  def save_rider_data(data)
    rider = Rider.new
    rider[:bike_name] = data['BIKENAME']
    rider[:year] = data['YEAR']
    rider[:email] = data['EMAIL']
    rider[:licence_number] = data['LICENCENUMBER']
    rider[:owner_type] = data['OWNER']
    rider[:user_name] = data['USERNAME']
    rider[:bike_number] = data['BIKENUMBER']
    rider[:dob] = data['DATEOFBIRTH']
    rider.save!
    rider
  end
end
