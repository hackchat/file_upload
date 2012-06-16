class UploadersController < ApplicationController

  def show
    @room_id = params[:room_id]
    @user_token = params[:user_token]
  end

  def create
    if params[:file]
      file = params[:file]
      upload = Upload.new(params[:data])
      upload.upload_to_s3(file.original_filename, file)
      upload.save
      render json: { status: :created, url: upload.url }
    else
      head 422
    end
  end

  def options
    set_access_control_headers
    Rails.logger.info(response.headers.inspect)
    head :ok
  end 

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST'
    headers['Access-Control-Allow-Headers'] = 'X-CSRF-Token, Content-Type'
  end

end
