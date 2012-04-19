class T < ActiveRecord::Base
  has_many :reasons, dependent: :destroy
  has_many :scorings, dependent: :destroy
  has_one :quiz, dependent: :destroy
end