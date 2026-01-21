
  module OrdersHelper
    def status_badge(status)
      base = "inline-flex items-center px-2.5 py-1 rounded-full text-xs font-medium"
      case status
      when "Done"
        content_tag(:span, "Done", class: "#{base} bg-emerald-50 text-emerald-700")
      when "Packing"
        content_tag(:span, "Packing", class: "#{base} bg-amber-50 text-amber-700")
      when "Cancelled"
        content_tag(:span, "Cancelled", class: "#{base} bg-rose-50 text-rose-700")
      else
        content_tag(:span, (status.presence || "—"), class: "#{base} bg-slate-100 text-slate-700")
      end
    end
  end
  