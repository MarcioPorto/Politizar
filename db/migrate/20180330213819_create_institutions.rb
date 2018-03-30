class CreateInstitutions < ActiveRecord::Migration[5.1]
  def change
    create_table :institutions do |t|
      t.string :name
      t.references :country, foreign_key: true
      t.references :region, foreign_key: true

      t.timestamps
    end
  end
end
