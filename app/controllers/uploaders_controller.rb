class UploadersController < ApplicationController
  def show

  end

  def create
    file_name = Digest::SHA256.hexdigest "#{Time.now}"
    FileUploader.store(file_name, @tempfile, 'hackchat')
    render json: { url: "/hackchat/#{file_name}" }
  end
end
