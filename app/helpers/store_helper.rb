module StoreHelper
  def fillings_text(fillings)
    fillings.blank? ? 'no filling' : fillings
  end
end
