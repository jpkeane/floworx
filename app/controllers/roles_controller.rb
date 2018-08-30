class RolesController < ApplicationController
  def index
    @roles = Role.all
  end

  def show
    @role = Role.friendly.find(params[:id])
  end
end
