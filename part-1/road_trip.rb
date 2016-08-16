class Segment
  attr_reader :miles
  def initialize(miles)
    @miles = miles
  end

end


class RoadTrip
  attr_accessor :name
  attr_reader :segments

  def initialize(args = {})
    @name = args.fetch(:name)
    @segments = args.fetch(:segments)
  end

  def add_segment(new_segment)
    @segments << new_segment
  end

  def total_miles
    @total_miles = @segments.inject {|sum, segment| sum.miles[:miles] + segment.miles[:miles] }
    @total_miles
  end

  def average_miles_per_segment
    number_of_trips = @segments.length
    average_miles_per_segment = @total_miles/number_of_trips
    average_miles_per_segment
  end

end

#DRIVER CODE
# segments = [Segment.new(miles: 500), Segment.new(miles: 750)]
# road_trip = RoadTrip.new(name: 'Trip to SF', segments: segments)

# p road_trip.total_miles
# p road_trip.average_miles_per_segment
