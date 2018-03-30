class Region < ApplicationRecord
  has_many :subscribers
  belongs_to :country
end
