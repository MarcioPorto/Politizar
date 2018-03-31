class CreateBills < ActiveRecord::Migration[5.1]
  def change
    create_table :bills do |t|
      t.string :identifier
      t.text :description
      t.date :vote_date
      t.string :result
      t.text :result_description
      t.references :institution, foreign_key: true

      t.timestamps
    end
  end
end
