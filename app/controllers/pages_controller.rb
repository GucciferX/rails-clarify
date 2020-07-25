class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home contact]

  def home
    @plans = policy_scope(Plan)
  end

  def contact
  end
end
