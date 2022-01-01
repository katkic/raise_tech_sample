require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    region: 'ap-northeast-1',
    # aws_access_key_id: ENV['S3_BUDGET_ACCESS_KEY'],
    # aws_secret_access_key: ENV['S3_BUDGET_SECRET_ACCESS_KEY'],
    path_style: true
  }
  config.storage :fog
  config.fog_provider = 'fog/aws'
  config.fog_directory = ENV['S3_BUDGET_NAME']
  # アップロードしたリソースを公開する場合はtrue
  config.fog_public = false
  config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}
end
