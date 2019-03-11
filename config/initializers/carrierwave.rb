CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV['AWS_KEY'],                        # required unless using use_iam_profile
    aws_secret_access_key: ENV['AWS_SECRET'],                        # required unless using use_iam_profile
    use_iam_profile:       false,                         # optional, defaults to false
    region:                'us-east-2',                  # optional, defaults to 'us-east-1'
  }

  config.fog_directory  = 'seclassics'                                      # required
  config.fog_public     = true                                                 # optional, defaults to true
  config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
end