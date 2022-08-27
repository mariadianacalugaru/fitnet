class Schedule < ApplicationRecord
    has_many :schedule_exercises
    has_many :exercises
end
