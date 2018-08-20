

# if Rails.env.production?
CarrierWave.configure do |config|
  config.fog_provider = "fog/aws"
  config.fog_credentials = {
    :provider => "AWS",                            # required
    :aws_access_key_id => ENV["AWS_ACCESS_KEY_ID"],         # required
    :aws_secret_access_key => ENV["AWS_SECRET_ACCESS_KEY"],     # required
    # use_iam_profile: true,                         # optional, defaults to false
    region: "us-east-1",                  # optional, defaults to 'us-east-1'
  # # host: "s3.example.com",             # optional, defaults to nil
  # endpoint: "s3-website-us-east-1.amazonaws.com", #
  }

  config.fog_directory = ENV["AWS_BUCKET_NAME"]                 # required
  config.fog_public = true                                   # optional, defaults to true
  config.root = Rails.root.join("tmp")
  config.permissions = 0777
  config.fog_attributes = {"Cache-Control" => "max-age=315576000"}  # optional, defaults to {}
end
# else
#   CarrierWave.configure do |config|
#     config.storage :file
#   end
# end
