class Sudoku
  def initialize(rows)
    @rows = rows
  end

  def done_or_not?
    check?(@rows) && check?(@rows.transpose) && check?(cells)
  end

  private

  def check?(rows)
    rows.all? { |row| row.sort == Array(1..9) }
  end

  def cells
    return @cells if @cells

    # Magic has been proposed Petre
    @cells = @rows
                 .flatten
                 .each_slice(3)
                 .group_by
                 .with_index { |_, i| i % 3 }
                 .values
                 .flatten
                 .each_slice(9)
                 .to_a
  end
end