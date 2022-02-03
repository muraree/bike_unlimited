class RidersController < ApplicationController
  before_action :authorize_request

  def import_csv
    file_path = params[:file].path
    tmp = params[:file].tempfile
    destiny_file = File.join('public', params[:file].original_filename)
    FileUtils.move tmp.path, destiny_file
    ImportCsvJob.set(wait_until: 60.seconds).perform_later(destiny_file)
  end

  private
  def file_params
    params.permit(:file)
  end
end
