require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    region: ENV['AWS_RAISE_TECH_SAMPLE_S3_REGION'],
    aws_access_key_id: Rails.application.credentials.aws[:access_key_id],
    aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
    path_style: true
  }
  config.storage :fog
  config.fog_provider = 'fog/aws'
  config.fog_directory = ENV['AWS_RAISE_TECH_SAMPLE_S3_BUCKET']
  # アップロードしたリソースを公開する場合はtrue
  config.fog_public = false
  config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}
end
