class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true,
    format: {
      with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
      message: 'formato de correo electrónico inválido'
    }

  validates :username, presence: true, uniqueness: true,
    length: { in: 3..15 },
    format: {
      with: /\A[a-zA-Z0-9-]+\z/,
      message: 'solo se permiten letras, números y guiones'
    }

  validates :password, length: { minimum: 6, message: 'debe tener al menos 6 caracteres' }
  has_many :products, dependent: :destroy
  has_many :favorites
  before_save :downcase_attributes

  private

  def downcase_attributes
    self.username = username.downcase
    self.email = email.downcase
  end
end
