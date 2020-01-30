require 'json'

def get_first_name_of_season_winner(data, season)
  # code here
  winner = data[season].find { |person|
    person["status"] == "Winner"
  }
  winner["name"].split(" ")[0]
end

def get_contestant_name(data, occupation)
  # code here
  data.each { |season, participants|
    participants.each{ |participant|
      if participant["occupation"] == occupation
        return participant["name"]
      end
    }

  }
end

def count_contestants_by_hometown(data, hometown)
  # code here
  arr = []
  count = 0
  data.each { |season, participants|
    participants.each { |participant|
      if participant["hometown"] == hometown
        count += 1
      end
     
    }
  }
  
  count
end

def get_occupation(data, hometown)
  # code here
  data.each { |season, participants|
    participants.each { |participant|
      if participant["hometown"] == hometown
        return participant["occupation"]
      end
    }
  }
end

def get_average_age_for_season(data, season)
  # code here
  sum_age = data[season].sum { |sum = 0, participant|
    sum = sum + participant["age"].to_f
  }
  (sum_age/data[season].length).round 
end


data = JSON.parse(File.read('spec/fixtures/contestants.json'))


puts get_average_age_for_season(data, "season 10")