class Bill < ApplicationRecord
  has_many :votes
  belongs_to :institution
end
