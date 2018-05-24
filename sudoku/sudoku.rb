class Sudoku
  def initialize(board)
    @board = board
  end

  def done_or_not?
    check_rows? && check_columns? && check_cells?
  end

  private

  def check_sum?(rows)
    rows.all? {|row| row.inject(0, :+) == sum}
  end

  def check_rows?
    check_sum? rows
  end

  def check_columns?
    check_sum? columns
  end

  def check_cells?
    check_sum? cells
  end

  def length
    @board.length
  end

  def rows
    @board
  end

  def columns
    return @columns if @columns
    @columns = Array(0...length).reduce([]) do |columns, n|
      column = []
      @board.each do |row|
        column << row[n]
      end
      columns << column
    end
  end

  def cells
    return @cells if @cells

    # todo: make this easy
    @cells = [
        [ rows[0][0], rows[0][1], rows[0][2],
          rows[1][0], rows[1][1], rows[1][2],
          rows[2][0], rows[2][1], rows[2][2]],
        [ rows[0][3], rows[0][4], rows[0][5],
          rows[1][3], rows[1][4], rows[1][5],
          rows[2][3], rows[2][4], rows[2][5]],
        [ rows[0][6], rows[0][7], rows[0][8],
          rows[1][6], rows[1][7], rows[1][8],
          rows[2][6], rows[2][7], rows[2][8]],

        [ rows[3][0], rows[3][1], rows[3][2],
          rows[4][0], rows[4][1], rows[4][2],
          rows[5][0], rows[5][1], rows[5][2]],
        [ rows[3][3], rows[3][4], rows[3][5],
          rows[4][3], rows[4][4], rows[4][5],
          rows[5][3], rows[5][4], rows[5][5]],
        [ rows[3][6], rows[3][7], rows[3][8],
          rows[4][6], rows[4][7], rows[4][8],
          rows[5][6], rows[5][7], rows[5][8]],

        [ rows[6][0], rows[6][1], rows[6][2],
          rows[7][0], rows[7][1], rows[7][2],
          rows[8][0], rows[8][1], rows[8][2]],
        [ rows[6][3], rows[6][4], rows[6][5],
          rows[7][3], rows[7][4], rows[7][5],
          rows[8][3], rows[8][4], rows[8][5]],
        [ rows[6][6], rows[6][7], rows[6][8],
          rows[7][6], rows[7][7], rows[7][8],
          rows[8][6], rows[8][7], rows[8][8]],
    ]
  end

  def sum
    return @sum if @sum
    @sum = Array(0..length).inject(0, :+)
  end
end