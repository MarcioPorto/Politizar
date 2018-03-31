class Representative < ApplicationRecord
  belongs_to :party
  belongs_to :region
  belongs_to :institution
end
