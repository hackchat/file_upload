class Upload < ActiveRecord::Base
  attr_accessible :room_id, :url, :user_token

  def upload_to_s3(file_name, file)
     FileUploader.store(file_name, file, CURRENT_BUCKET)
     self.url = "http://#{CURRENT_BUCKET}.s3.amazonaws.com/#{file_name}"
  end
end
