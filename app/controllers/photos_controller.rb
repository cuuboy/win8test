
class PhotosController < ApplicationController
	
	def index
	
		@file_path = "public/uploads/photos/"
		
		@d = Dir.new( Rails.root + @file_path )
		
	
	end
	
	def show
		end
		
	def test
		puts 'Print test'
	end
	
	def upload
	 	@upload_file = params[:File0]
	 	
	 	params[ :upload ] = @upload_file
	 	exit
	 	#get original filename
	 	@filename = @upload_file.original_filename
	 			 	
	 	@file_path = "public/uploads/photos/"
	 	file_name = @upload_file.filename
	 	File.open( @file_path + file_name , 'wb') do | file |
	 		file.write( @upload_file.read )
	 	end
	end
end