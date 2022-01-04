require './error'

class Scientist
  """
    Scientist class for citation calculation
  """
  attr_reader :citations

  def initialize(citations)
    raise ScientistError, 'Citations must not contain values less than zero' if citations.any?(&:negative?)

    @citations = citations
  end

  def h_index(h_value)
    raise ScientistError, 'h-index must not be less than zero' if h_value.negative?

    citations.select { |citation| citation >= h_value }.size
  end
end
