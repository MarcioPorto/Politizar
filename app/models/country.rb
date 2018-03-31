class Country < ApplicationRecord
  has_many :regions
  has_many :institutions
  has_many :parties
end
