class Triangle
  attr_accessor :side_1, :side_2, :side_3

  def initialize(side_1, side_2, side_3)
    @sides = [ side_1, side_2, side_3 ]
  end

  def kind
    @sides.each { |side| raise TriangleError if side <= 0 }
    @sides.permutation(3).each do |side|
      raise TriangleError if side[0] + side[1] <= side[2]
    end
    return :equilateral if @sides.uniq.length == 1
    return :isosceles if @sides.uniq.length == 2
    return :scalene
  end

  class TriangleError < StandardError
    def message
      "You've entered dimensions for an imposible triangle!  The sum of the lengths of "
      "any two sides must be greater than the length of the remaining side."
    end
  end
end
