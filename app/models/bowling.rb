class Bowling
  include ActiveModel::Model

  attr_accessor :scores

  def initialize(params=nil)
    @scores = params.present? ? params[:scores].split(' ').collect(&:to_i) : []
  end

  def exclude_strikes
    @scores.delete_if{ |score| score == 10 }
  end

  def frames
    exclude_strikes.in_groups_of(2, 0)
  end

  def strikes
    @scores.count(10) * 30
  end

  def spares
    frames.map{ |score| score.inject(&:+) }.count(10) * 15
  end

  def scores
    frames_scores = frames.map{ |score| score.inject(&:+) }
    frames_scores.delete_if{ |score| score == 10 }.inject(&:+)
  end

  def calculate_scores
    strikes + spares + (scores || 0)
  end
end