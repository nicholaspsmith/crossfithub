CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV['AS3_ACCESS_KEY'],
    :aws_secret_access_key  => ENV['AS3_SECRET_ACCESS_KEY'],
    :region                 => 'us-west-2'
  }

  config.fog_directory = 'nicole-mks-3'
  config.fog_public = true
  config.fog_attributes = {'Cache-Control' => 'max-age=315576000'} 
end