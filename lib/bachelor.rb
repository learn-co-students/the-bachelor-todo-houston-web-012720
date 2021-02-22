require 'pry'

def get_first_name_of_season_winner(data, season)
    return data[season].find do |person|
        person["status"] == "Winner"
    end["name"].split(" ")[0]
end

def get_contestant_name(data, occupation)    
    data.each do |season, people|
        searched_person = people.find{|person| 
            person["occupation"] == occupation
        }
        if searched_person != nil
            return searched_person["name"]
        end
    end
end

def count_contestants_by_hometown(data, hometown)
    counter = 0
    data.each_value do |value|
        value.each do |person|
            if person["hometown"] == hometown
                counter+=1
            end
        end
    end
    return counter
end

def get_occupation(data, hometown)
    data.each_value do |value|
        searched_person = value.find{|person| 
            person["hometown"] == hometown
        }
        if searched_person != nil
            return searched_person["occupation"]
        end
    end
    
end

def get_average_age_for_season(data, season)
    age_sum = 0
    data[season].each do |person|
        age_sum += person["age"].to_f
    end
    return (age_sum / data[season].count).round()
end
