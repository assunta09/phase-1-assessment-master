require_relative 'segment'

class RoadTrip
  attr_reader :segments
  attr_accessor :name

  def initialize(args = {})
    @name = args[:name]
    @segments = args[:segments]
  end

  def add_segment(new_segment)
    @segments << new_segment
  end

  def total_miles
    total_miles = 0
    @segments.each do |segment|
      total_miles += segment.miles
    end
    total_miles
  end

  def average_miles_per_segment
    number_of_segments = @segments.length
    average_miles_per_segment = total_miles/number_of_segments
  end
end

# segments = [Segment.new(miles: 500), Segment.new(miles: 750)]
# road_trip = RoadTrip.new(name: 'Trip to SF', segments: segments)
# road_trip
