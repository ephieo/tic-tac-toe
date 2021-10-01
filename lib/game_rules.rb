
class GameRules 

    def validate_input(num)
        num.to_s.match(/[0-8]/) ? true : false
    end
end