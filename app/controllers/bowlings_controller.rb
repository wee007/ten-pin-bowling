class BowlingsController < ApplicationController
  def new
    @bowling = Bowling.new
  end

  def calculate
    @bowling = Bowling.new(params[:bowling])
    @total_score = @bowling.calculate_scores
    render :index
  end
end
