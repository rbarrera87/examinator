class Quiz < ApplicationRecord
  has_many :questions
  has_many :response_sets
end
