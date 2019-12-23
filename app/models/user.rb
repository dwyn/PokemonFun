class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :trainers
  has_many :pokemons
  # has_many :trained_pokemons, through: :trainers, class: "Pokemon", foreign_key: "trainer_id"

  validates :first_name, presence: true
  validates :last_name, presence: true

  scope :administrators, -> { where(admin: true) }
  scope :normies, -> { where(admin: false) }
end
