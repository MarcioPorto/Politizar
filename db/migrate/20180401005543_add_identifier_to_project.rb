class AddIdentifierToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :identifier, :string
  end
end
