module ApplicationHelper
  def bootstrap_alert_class_for(flash_type)
    {success: "alert-primary", error: "alert-danger", alert: "alert-warning", notice: "alert-info"}[flash_type.to_sym] || ("alert-" + flash_type).to_sym
  end
end
