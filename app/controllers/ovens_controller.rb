class OvensController < ApplicationController
  before_action :authenticate_user!

  def index
    @ovens = current_user.ovens
  end

  def show
    @oven = current_user.ovens.includes(:cookies).find_by!(id: params[:id])
  end

  def empty
    @oven = current_user.ovens.find_by!(id: params[:id])
    @oven.cookies.update(storage: current_user) if @oven.cookies.present?

    redirect_to @oven, alert: 'Oven emptied!'
  end
end
