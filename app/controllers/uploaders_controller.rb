class UploadersController < ApplicationController
  def show

  end

  def create
    file = params[:file]
    file_name = file.original_filename
    upload = Upload.new(params[:data])
    upload.upload_to_s3(file_name, file).save
    render json: { url: upload.url }
  end

  def options
    set_access_control_headers
    head :ok
  end 

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*, http://hackchat.dev'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Max-Age'] = '1000'
    headers['Access-Control-Allow-Headers'] = '*, X-Requested-With, X-Prototype-Version, X-CSRF-Token'
  end

end
