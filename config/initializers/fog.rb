CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider                         => 'Google',
    :google_storage_access_key_id     => 'GOOGH6BGJTMK3WAVGFIF',
    :google_storage_secret_access_key => 'lZ3uqKpixKCaOlhIElJLgWG0Vsd0sSyvrlVRyMhm'
  }
  config.fog_directory = 'studout_storage'
end
