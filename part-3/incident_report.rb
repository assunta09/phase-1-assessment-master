require_relative 'reports'

class IncidentReport < Report
  attr_reader :reporter

  def initialize(args = {})
    @reporter = args.fetch(:reporter) { "anonymous" }
    super
  end

end

