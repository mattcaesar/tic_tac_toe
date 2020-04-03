class ComputerPlayer
    attr_reader :mark

    def initialize(mark_value, n)
        @mark = mark_value
        @grid_length = n
    end

    def get_position(position_arr)  
        position = position_arr.sample
        p "Das Terminator will play position #{position} with mark #{@mark}"

        if !valid_chars(position) || position.length != 2
            raise "ERROR: Entry must be in 'row-number [space] column-number' format, from 1 to #{@grid_length}"
        end
        
        @row = position[0] - 1
        @column = position[1] - 1
        
        return [@row, @column]
    end

    def valid_chars(arr)
        valid_chars = [*1..@grid_length]
        arr.all? { |char| valid_chars.include?(char) }
    end

end

#tests

# comp = ComputerPlayer.new(:T, 5)
# position_arr = [[1,1], [1,2], [2,1], [2,2]]
# comp.get_position(position_arr)