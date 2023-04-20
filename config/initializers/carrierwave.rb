CarrierWave.configure do |config|
    if Rails.env.production?
      config.root = '/mnt/myapp_images'
    else
      config.root = Rails.root.join('public')
    end
  
    config.cache_dir = "#{config.root}/tmp/uploads"
    config.store_dir = "#{config.root}/uploads"
  end
  