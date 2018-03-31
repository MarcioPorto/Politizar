class Representative < ApplicationRecord
  has_many :votes
  belongs_to :party
  belongs_to :region
  belongs_to :institution
end
