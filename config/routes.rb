FileUpload::Application.routes.draw do
  resource :uploader

  #CORS
  match '/uploader', :controller => 'uploaders', :action => 'options', :constraints => {:method => 'OPTIONS'}
end
