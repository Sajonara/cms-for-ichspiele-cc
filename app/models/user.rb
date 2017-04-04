# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  is_admin        :boolean          default(FALSE)
#

class User < ApplicationRecord
  before_save { self.email = email.downcase }
  
  validates :name, presence: { message: "Du hast keinen Benutzernamen angegeben." },
                   uniqueness: { message: "Dieser Benutzername wird nicht erlaubt." }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: { message: "Du hast keine E-Mail-Adresse eingegeben." },
                    uniqueness: { message: "Diese E-Mail-Adresse wird nicht erlaubt." },
                    confirmation: true, format: { with: VALID_EMAIL_REGEX }
  validates :is_admin, inclusion: { in: [true, false] }
  
  has_many :games
  has_many :articles
  has_secure_password
  validates :password, presence: { message: "Du hast kein Passwort eingegeben." },
                       length: { minimum: 8, message: "Das Passwort muss mindestens 8 Zeichen lang sein." },
                       allow_nil: true

  default_scope -> { order(name: :asc) }
end
