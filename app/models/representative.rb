class Representative < ApplicationRecord
  has_many :votes
  has_many :projects
  belongs_to :party
  belongs_to :region
  belongs_to :institution
end
