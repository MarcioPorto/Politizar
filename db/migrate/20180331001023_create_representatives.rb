class CreateRepresentatives < ActiveRecord::Migration[5.1]
  def change
    create_table :representatives do |t|
      t.string :identifier
      t.string :name
      t.string :full_name
      t.string :gender
      t.string :photo
      t.string :email
      t.integer :total_sessions
      t.integer :present_sessions
      t.integer :justified_absences
      t.integer :unjustified_absences
      t.string :last_presence_update
      t.references :party, foreign_key: true
      t.references :region, foreign_key: true
      t.references :institution, foreign_key: true

      t.timestamps
    end
  end
end
