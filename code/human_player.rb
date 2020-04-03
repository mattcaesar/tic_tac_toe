class HumanPlayer
    attr_reader :mark

    def initialize(mark_value, n)
        @mark = mark_value
        @grid_length = n
    end

    def get_position(position_arr)       
        p "Player #{@mark}, enter a position as 'row-number [space] column-number'"
        position = gets.chomp.split(" ").map(&:to_i)

        while !position_arr.include?(position)
            p "Your positon was invalid, puny human. Try again."
            p "Player #{@mark}, enter a position as 'row-number [space] column-number'"
            position = gets.chomp.split(" ").map(&:to_i)
        end

        # if !valid_chars(position) || position.length != 2
        #     raise "ERROR: Entry must be in 'row-number [space] column-number' format, from 1 to #{@grid_length}"
        # end
        
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

# matt = HumanPlayer.new(:M, 3)
# position_arr = [[1,1], [1,2], [2,1], [2,2]]
# matt.get_position(position_arr)