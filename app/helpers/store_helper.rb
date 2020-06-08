module StoreHelper
  def fillings_text(fillings)
    fillings&.strip.blank? ? Cookie::EMPTY_FILLING_TEXT : fillings
  end
end
