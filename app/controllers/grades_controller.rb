class GradesController < ApplicationController
  def index
    @grades = Grade.all
  end

  def show
    @grade = Grade.friendly.find(params[:id])
  end
end
