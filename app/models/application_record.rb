# Country, Region, Institution, Party, Representative, Bill, Vote, Project
# LegalProcess

# Country
# (has_many: regions, institutions, parties)
# - name

# Region
# (has_many: representatives, institutions(optional))
# - name
# - country_id (fk)

# Institution
# (has_many: representatives, bills)
# - name
# - country_id (fk)
# - region_id (fk) (optional)

# Party
# (has_many: representatives)
# - name
# - description
# - country_id (fk)

# Representative 
# (has_many: votes, projects, legal_processes)
# - identifier
# - name
# - full_name
# - gender
# - photo
# - email
# - total_sessions
# - present_sessions
# - justified_absences
# - unjustified_absences
# - last_presence_update
# - party_id (fk)
# - region_id (fk)
# - institution_id (fk)

# Bill
# (has_many: votes)
# - identifier (s)
# - description
# - vote_date
# - result (s)
# - result_description (s)
# - institution_id (fk)

# Vote
# - vote (s)
# - bill_id (fk)
# - representative_id (fk)

# Project
# - name
# - description
# - status
# - representative_id (fk)

# LegalProcess
# - description
# - representative_id (fk)

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
