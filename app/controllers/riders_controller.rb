class RidersController < ApplicationController
	before_action :authorize_request	
	
	def import_csv
		ImportCsv.new(params[:file]).run
	end
	
	private
	def file_params
		params.permit(:file)
	end	
end
