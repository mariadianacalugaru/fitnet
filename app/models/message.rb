class Message < ApplicationRecord
    belongs_to :user
    validates :body, :for, presence: true
end
