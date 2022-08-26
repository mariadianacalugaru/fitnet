require "http"
require 'uri'
require 'openssl'
require 'json'

class Tmdb
    @targets = ['abs','biceps','cardiovascular system', 'glutes', 'hamstrings', 'pectorals', 'quads', 'triceps']
    def self.get_exercises
        
        @targets.each do |target|
            begin
                response = HTTP.timeout(10).get("https://exercisedb.p.rapidapi.com/exercises/target/"+target+"?rapidapi-key=81a3404446msh0f894cd6015fc87p19cf17jsne5272a1fc344")
            rescue => e
                return false
            end
            
            results = response.parse

            results.each do |r|
                if Exercise.where(target: r['target']).count < 20
                    exercise = Exercise.new
                    exercise.bodyPart = r['bodyPart']
                    exercise.equipment = r['equipment']
                    exercise.gifUrl = r['gifUrl']
                    exercise.name = r['name']
                    exercise.target = r['target']
                    exercise.save!
                end
            end
        end
    end
end