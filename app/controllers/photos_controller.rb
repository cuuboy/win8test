
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
		 			 	
		 	@upload_file = params[:upload_file]['filename'] 
		 	
		 	#get original filename
		 	@photo.filename = @upload_file.original_filename
		 	
		 	# check file type and save
		 	case @upload_file.content_type
		 	when 'image/jpeg'
		 		@photo.file_extension = 'jpg'
		 		
		 	when 'image/png'
		 		@photo.file_extension = 'png'
		 	
		 	when 'image/gif'
		 		@photo.file_extension = 'gif'
		 	
		 	else
		 		@errors = true
		 		@error_msg = "#{@upload_file.content_type} is wrong file type for photos."
		 	end
		 	
		 	@photo.file_path = "public/uploads/photos/"
		 	file_name = @photo.name + '.' + @photo.file_extension
		 	File.open( @photo.file_path + file_name , 'wb') do | file |
		 		file.write( @upload_file.read )
		 	end
			
			@photo.filename = root_url + 'uploads/photos/' + file_name
	end
end
