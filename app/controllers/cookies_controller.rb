class CookiesController < ApplicationController
  before_action :authenticate_user!

  def new
    @oven = current_user.ovens.find_by!(id: params[:oven_id])
    if @oven.cookies.present?
      redirect_to @oven, alert: 'A set of cookies are already in the oven!'
    else
      @cookie = @oven.cookies.new
    end
  end

  def create
    @oven = current_user.ovens.find_by!(id: params[:oven_id])

    CookSheetCookiesService.call(oven: @oven, params: cookie_params)

    redirect_to oven_path(@oven)
  end

  private

  def cookie_params
    params.require(:cookie).permit(:fillings, :amount)
  end
end
