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
    """
    A scientist has index h if h of his/her N papers have at least h citations each,
    and the other N − h papers have no more than h citations each.
    """
    raise ScientistError, 'h-index must not be less than zero' if h_value.negative?

    h_index_value = nil

    h_papers = citations.select { |citation| citation >= h_value }.size
    h_index_value = h_papers if h_papers >= h_value && (citations.size - h_papers) < h_value
    h_index_value
  end
end
