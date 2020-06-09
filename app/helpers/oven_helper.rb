module OvenHelper
  def retrieve_cookies_button
    hide_class = 'hide' unless @oven.all_cookies_ready?
    button_to "Retrieve Cookie", empty_oven_path(@oven), class: "empty-oven button tiny #{hide_class}"
  end
end
