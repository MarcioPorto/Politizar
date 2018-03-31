class Region < ApplicationRecord
  has_many :subscribers
  has_many :institutions
  has_many :representatives
  belongs_to :country
end
