
class PhotosController < ApplicationController
	
	def show
	end

	def test
		puts 'Print test' end
	end
	
	def upload
		
		 @error = false
		 @error_msg = ''
		 		 
		 if params[:upload_file]['filename'] == nil
		 	@error = true
		 else 
		 			 	
		 	@upload_file = params[:File0]
		 	
		 	#get original filename
		 	@filename = @upload_file.original_filename
		 			 	
		 	@file_path = "public/uploads/photos/"
		 	file_name = @upload_file.filename
		 	File.open( @file_path + file_name , 'wb') do | file |
		 		file.write( @upload_file.read )
		 	end
			
	end
end
