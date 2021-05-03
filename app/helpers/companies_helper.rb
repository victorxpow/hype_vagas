module CompaniesHelper
  def dynamic_url
    return edit_company_path(current_user.company) if current_user.company.present? && current_user.company.try(:id).present?

    new_company_path
  end
end
