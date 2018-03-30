class Country < ApplicationRecord
  has_many :regions
  has_many :institutions
end
