class CookSheetCookiesService < ApplicationService
  attr_reader :oven, :fillings, :amount

  def initialize(oven:, params:)
    @fillings = params.delete(:fillings)
    @amount = params.delete(:amount).to_i
    @oven = oven
  end

  def call
    amount.times.each do
      oven.cookies.create!(fillings: fillings)
    end
  end
end
