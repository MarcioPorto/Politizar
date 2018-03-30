class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  validate :save_admin?

  private

    def save_admin?
      super_admins = Admin.where(super_admin: true)
      errors.add(:super_admin, "can't have multiple super admins") if super_admins.length >= 1
    end
end
