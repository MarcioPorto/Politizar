class Institution < ApplicationRecord
  has_many :representatives
  belongs_to :country
  belongs_to :region, optional: true
end
