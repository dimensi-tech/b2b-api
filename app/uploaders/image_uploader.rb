class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file
  # storage :fog

  def store_dir
    # Digital Ocean setup
    # "#{ENV['DO_FOLDER']}/uploads/documents/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Validations
  def extension_whitelist
    %w[jpg jpeg gif png pdf]
  end

  def content_type_blacklist
    ['application/text', 'application/json']
  end
end
