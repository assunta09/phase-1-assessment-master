require_relative 'camper_actions'

class Tent
  include Reservation
  include Damage
  attr_reader :capacity

  def initialize(args = {})
    @capacity = args.fetch(:capacity) { 3 }
  end

end
