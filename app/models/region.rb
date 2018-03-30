class Region < ApplicationRecord
  has_many :subscribers
  has_many :institutions
  belongs_to :country
end
