class Image
  def self.random
    # https://github.com/hanklords/flickraw
    FlickRaw.secure = true
    FlickRaw.api_key = "454dbddf95aacd2b2d57cf4f90b6b5c2"
    FlickRaw.shared_secret = "672a72f3a2133f68"

    # http://www.flickr.com/photos/icco/sets/72157601200827657/
    photos = flickr.photosets.getPhotos(:photoset_id => '72157601200827657', :media => 'photos', :extras => 'url_o').photo
    p photos
    
    return photos.sample['url_o']
  end
end
