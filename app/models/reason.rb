class Reason < ActiveRecord::Base
  belongs_to :topic
  has_many :answers, dependent: :destroy
end