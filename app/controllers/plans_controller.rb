class PlansController < ApplicationController
  def index
    @plans = policy_scope(Plan)
  end

  def show
    @plan = Plan.find(params[:id])
    authorize @plan
    @coaches = coaches
  end

  def coaches
    @plan = Plan.find(params[:id])
    @plan.coaches
  end
end
