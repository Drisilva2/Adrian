class User < ApplicationRecord
  # Validaciones
  validates :name, presence: true
  validates :mail, presence: true, uniqueness: true
  validate :email_validate 

  REGEX_PATTERN = /\A[^@\s]+@gmail\.com\z/
  private

  def email_validate
    unless mail =~ REGEX_PATTERN
      errors.add(:mail, "tiene un formato inválido")
    end
  end
end
