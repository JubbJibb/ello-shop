module OrdersHelper
  def status_badge_class(status)
    case status
    when "Packing"
      "badge-info"
    when "Done"
      "badge-success"
    when "Cancelled"
      "badge-muted"
    else
      "badge-neutral"
    end
  end
end
