module PhoneNumber
  NANP_COUNTRY_CODE = 1
  PHONE_LEN = 10

  def self.clean(number)
    sanitized = number.gsub(/[^0-9]/, "")

    sanitized = sanitized[1..] if with_country_code?(sanitized[0].to_i)

    return nil if sanitized.length != PHONE_LEN

    if !subcode_valid?(sanitized[0].to_i) || !subcode_valid?(sanitized[3].to_i)
      return nil
    end

    sanitized
  end

  private

  def self.with_country_code?(country_code)
    country_code == NANP_COUNTRY_CODE
  end

  def self.subcode_valid?(aera_code)
    aera_code >= 2 && aera_code <= 9
  end
end
