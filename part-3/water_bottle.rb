require_relative 'camper_actions'

class WaterBottle
  include Reservation
  include Damage
  attr_reader :capacity, :material

  def initialize(args = {})
    @capacity = args.fetch(:capacity) { 2 } #Q: does it make sense to take this into a separate function?
    @material = args.fetch(:material) { "tin" }
  end

end
