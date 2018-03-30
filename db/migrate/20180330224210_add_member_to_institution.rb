class AddMemberToInstitution < ActiveRecord::Migration[5.1]
  def change
    add_column :institutions, :member, :string
    add_column :institutions, :member_plural, :string
  end
end
