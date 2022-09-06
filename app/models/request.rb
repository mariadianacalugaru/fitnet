class Request < ApplicationRecord
    belongs_to :user

    validates :age, :weight, :height, presence: true
  end
  