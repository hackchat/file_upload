class UploadersController < ApplicationController

  def show
    @room_id = params[:room_id]
    @user_token = params[:user_token]
    @uploaded_files = Upload.where(user_token: @user_token, room_id: @room_id)
  end

  def create
    if params[:file]
      file = params[:file]
      upload = Upload.new(user_token: params[:file_user_token], room_id: params[:file_room_id])
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
