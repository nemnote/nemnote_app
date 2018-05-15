class PictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process resize_to_fill: [200, 200]

   if Rails.env.production? || Rails.env.staging?
     storage :fog
   else
     storage :file
   end

  version :thumb do
    process :resize_to_limit => [300, 300]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
