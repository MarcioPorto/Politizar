class Party < ApplicationRecord
  has_many :representatives
  belongs_to :country
end
