class Map < ActiveRecord::Base

  mount_uploader :map, MapUploader

  validates :name, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 3, maximum: 15}
end