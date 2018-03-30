class AddAbbreviationToRegion < ActiveRecord::Migration[5.1]
  def change
    add_column :regions, :abbreviation, :string
  end
end
