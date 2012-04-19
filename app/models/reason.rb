class Reason < ActiveRecord::Base
  belongs_to :t
  has_many :answers, dependent: :destroy
  has_many :scorings, dependent: :destroy
end