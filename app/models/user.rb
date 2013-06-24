class User < ActiveRecord::Base
  has_secure_password
  validates :email, email_format: true, uniqueness: true
  validates :phone_number, presence: true, unless: :valid_us_phone_number,
                           uniqueness: true

  before_validation :format_phone_number

  private
  def valid_us_phone_number
    return false unless self.phone_number
    num = self.phone_number.gsub(/[^\d]/,"")
    invalid_number = num.length > 11
    invalid_number ||= num.length < 10
    invalid_number ||= num.length == 11 && num[1] != "1"
    not invalid_number
  end

  def format_phone_number
    return nil unless self.phone_number
    num = self.phone_number.gsub(/[^\d]/,"")
    self.phone_number = num.prepend "+1" if num.length == 10
    self.phone_number = num.prepend "+" if num.length == 11
  end
end
