# frozen_string_literal: true

class Clock
  MINUTES_IN_HOUR = 60
  HOURS_IN_DAY = 24
  attr_reader :hour, :minute

  def initialize(hour: 0, minute: 0)
    @minutes = calculate_hours(hour) + minute
  end

  def to_s
    format('%02i:%02i', *time)
  end

  def hours
    @minutes / MINUTES_IN_HOUR % HOURS_IN_DAY
  end

  def minutes
    @minutes % MINUTES_IN_HOUR
  end

  def +(clock)
    @minutes += calculate_hours(clock.hours) + clock.minutes
    self
  end

  def -(clock)
    @minutes += -calculate_hours(clock.hours) - clock.minutes
    self
  end

  private

  def time
    [@minutes / MINUTES_IN_HOUR % HOURS_IN_DAY, @minutes % MINUTES_IN_HOUR]
  end

  def calculate_hours(hours)
    hours * MINUTES_IN_HOUR
  end
end
