class Institution < ApplicationRecord
  has_many :representatives
  has_many :bills
  belongs_to :country
  belongs_to :region, optional: true
end
