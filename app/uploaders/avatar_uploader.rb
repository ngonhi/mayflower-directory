class AvatarUploader < CarrierWave::Uploader::Base
    
  include CarrierWave::MiniMagick
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  
  def store_dir
    'images'
    #/mayflower-data/images
  end
  
  def cache_dir
    'images'
  end


  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
   def extension_whitelist
     %w(jpg jpeg gif png)
   end
   
   #more whitelisting so only images get uploaded to the AWS
   def content_type_whitelist
    /image\//
   end
   
   # blacklisting some stuff thats not images
   def content_type_blacklist
    ['application/text', 'application/json']
   end
   
   
   #for resizing images to thumbnails
   

   process resize_to_fit: [800, 800]

   version :thumb do
     process resize_to_fill: [200,200]
   end


   
  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
