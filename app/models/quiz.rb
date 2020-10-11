class Quiz < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :response_sets
end
