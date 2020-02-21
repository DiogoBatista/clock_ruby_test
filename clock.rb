# frozen_string_literal: true

class Clock
  MINUTES_IN_HOUR = 60
  HOURS_IN_DAY = 24
  attr_reader :hour, :minute

  def initialize(hour: 0, minute: 0)
    @minutes = minutes_from_hours(hour) + minute
  end

  def to_s
    format('%02i:%02i', *time)
  end

  def hours
    hours_by_day
  end

  def minutes
    minutes_by_hour
  end

  def +(clock)
    @minutes += minutes_from_hours(clock.hours) + clock.minutes
    self
  end

  def -(clock)
    @minutes += -minutes_from_hours(clock.hours) - clock.minutes
    self
  end

  def ==(other)
    to_s == other.to_s
  end

  private

  def time
    [hours_by_day, minutes_by_hour]
  end

  def minutes_from_hours(hours)
    hours * MINUTES_IN_HOUR
  end

  def hours_by_day
    @minutes / MINUTES_IN_HOUR % HOURS_IN_DAY
  end

  def minutes_by_hour
    @minutes % MINUTES_IN_HOUR
  end
end
