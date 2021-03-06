class CreateParties < ActiveRecord::Migration[5.1]
  def change
    create_table :parties do |t|
      t.string :name
      t.text :description
      t.references :country, foreign_key: true

      t.timestamps
    end
  end
end
