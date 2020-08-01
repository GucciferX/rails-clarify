class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home contact]

  def home
    all_plans = policy_scope(Plan)
    @plans = all_plans.first(12)
  end

  def contact
  end
end
