#Q: do we need to split this into different files?

module Reservation
  def reserve
    @reserved = true
  end

  def reserved?
    @reserved
  end

  def end_reservation
    @reserved = false
  end

  def available?
    !reserved?
  end
end


module Damage
  def damaged?
    @damaged
  end

  def record_damage
    @damaged = true
  end

  def repair
    @damaged = false
  end
end

module AssignedEmployee
  def assigned?
    !!@assigned_employee
  end
end
