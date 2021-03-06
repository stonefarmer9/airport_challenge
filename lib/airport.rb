require_relative 'plane'
require_relative 'weather'
# Airport controls takeoff and landing depending on weather
class Airport
  DEFAULT_CAPACITY = 1

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @capacity = capacity
    @hangar = []
    @weather = weather
  end

  def land(plane)
    can_land?
    @hangar << plane
  end

  def take_off
    @hangar.pop if @weather.weather_condition == 'clear'
    @hangar
  end

  private

  def full?
    @hangar.size >= @capacity
  end

  def can_land?
    weather = @weather.weather_condition
    raise 'Bad Warp storm, Landing Denied' if weather == 'stormy'
    raise 'Hangar full' if full?
  end
end
