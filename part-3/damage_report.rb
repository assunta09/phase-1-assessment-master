class DamageReport
  attr_reader :description
  attr_accessor :assigned_employee

  def initialize(args = {})
    @description = args.fetch(:description) { "Unknown damage" }
    @resolved = false
  end

  def resolved?
    !!@resolved
  end

  def close
    @resolved = true
  end

  def assigned?
    !!@assigned_employee
  end
end
