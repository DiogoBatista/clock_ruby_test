# frozen_string_literal: true

class Clock
  attr_reader :hour

  def initialize(hour: 0)
    @minutes = hour * 60
  end

  def to_s
    format('%02i:00', time)
  end

  def time
    @minutes / 60
  end
end
