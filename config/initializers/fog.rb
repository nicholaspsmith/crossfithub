CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV['AS3_ACCESS_KEY'],
    :aws_secret_access_key  => ENV['AS3_SECRET_ACCESS_KEY'],
    :region                 => 'us-east-1'
  }

  config.fog_directory = 'nicole-mks-2'
  config.fog_public = true
  config.fog_attributes = {'Cache-Control' => 'max-age=315576000'} 
end