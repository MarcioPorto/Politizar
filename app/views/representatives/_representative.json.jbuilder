json.extract! representative, :id, :identifier, :name, :full_name, :gender, :photo, :email, :total_sessions, :present_sessions, :justified_absences, :unjustified_absences, :last_presence_update, :party_id, :region_id, :institution_id, :created_at, :updated_at
json.url representative_url(representative, format: :json)
