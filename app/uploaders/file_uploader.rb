# encoding: utf-8

class FileUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  include CarrierWave::MimeTypes
  
  include ::CarrierWave::Backgrounder::Delay
  
  # Choose what kind of storage to use for this uploader:
  if Rails.env.test? or Rails.env.cucumber?
      storage :file
  end

  if Rails.env.development?
      storage :file
  end

  if Rails.env.production?
      # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility if using fog: 
      # include Sprockets::Rails::Helper
      include Sprockets::Helpers      
      storage :fog
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{mounted_as}/#{model.id}"
  end
  
  def root
    "#{Rails.root}/public"
  end
  
  def cache_dir
    " ./tmp/uploads/#{mounted_as}/"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :thumb, :if => :image? do
    process :resize_to_fill => [300, 200,  gravity = 'Center']
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

  protected
    
    def image?(new_file)
      new_file.content_type.start_with? 'image'
    end

end
