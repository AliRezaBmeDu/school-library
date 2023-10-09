require_relative 'decorator'

class TrimmerDecorator
    def correct_name
        if @nameable.correct_name.length > 10
            return @nameable.correct_name[0..9]
        end
        @nameable.correct_name
    end
end