class Reason < ActiveRecord::Base
  belongs_to :t
  has_many :scorings, dependent: :destroy
end