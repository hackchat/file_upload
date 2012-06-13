class UploadersController < ApplicationController
  def show

  end

  def create
    file = params[:file]
    file_name = file.original_filename
    FileUploader.store(file_name, file, CURRENT_BUCKET)
    render json: { url: "/#{CURRENT_BUCKET}/#{file_name}" }
  end
end
