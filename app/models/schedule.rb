class Schedule < ApplicationRecord
    has_many :schedule_exercises, dependent: :destroy
    has_many :exercises
end
