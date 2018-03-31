class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.string :description
      t.references :bill, foreign_key: true
      t.references :representative, foreign_key: true

      t.timestamps
    end
  end
end
