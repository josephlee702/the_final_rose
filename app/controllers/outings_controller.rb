class OutingsController < ApplicationController
  def show
    @outing = Outing.find(params[:id])
  end

  def update
    @outing = Outing.find(params[:id])
    @contestant = Contestant.find(params[:contestant_id])
    
    if params[:contestant_id].present?
      @outing.remove_contestant(@contestant)
      redirect_to("/outings/#{@outing.id}")
    end
  end
end