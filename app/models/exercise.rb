class Exercise < ApplicationRecord
    has_many :schedule_exercises
    has_many :schedules
end
