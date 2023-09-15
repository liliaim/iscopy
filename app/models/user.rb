class User < ApplicationRecord
  validates :nickname, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validate :password_complexity

  has_many :plans 
  has_many :records 
  has_many :spots 

  private

  def password_complexity
    # パスワードは半角英数字を条件とする
    complexity_regex = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i

    return if password.blank? || password =~ complexity_regex

    errors.add :password, 'は半角英数字である必要があります'
  end

end
