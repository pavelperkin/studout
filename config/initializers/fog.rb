CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider                         => 'Google',
    :google_storage_access_key_id     => 'GOOGUFZMYY6RT7BRX2WU',
    :google_storage_secret_access_key => '8iWzISRVYPnD2xBZd+blP9vYtbFWLxyTF4wCqjV3'
  }
  config.fog_directory = 'fknt'
end