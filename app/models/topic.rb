class Topic < ActiveRecord::Base
  has_many :reasons, dependent: :destroy
  has_one :quiz, dependent: :destroy
end