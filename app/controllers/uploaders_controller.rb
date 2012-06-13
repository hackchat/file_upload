class UploadersController < ApplicationController
  def show

  end

  def create
    file_name = @original_filename.basename
    FileUploader.store(file_name, @tempfile, CURRENT_BUCKET)
    render json: { url: "/#{CURRENT_BUCKET}/#{file_name}" }
  end
end
