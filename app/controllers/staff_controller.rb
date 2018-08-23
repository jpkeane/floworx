class StaffController < ApplicationController
  def index
    @staff = Staff.all
  end

  def show
    @staff = Staff.friendly.find(params[:id])
  end
end
