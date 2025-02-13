module ApplicationHelper
  def phone(raw_number_string)
    number_to_phone(raw_number_string.remove(/[^\d]/), area_code: true)
  end
end
