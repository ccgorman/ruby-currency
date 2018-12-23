class CurrencyExchange

  require 'date'

  # Return the exchange rate between from_currency and to_currency on date as a float.
  # Raises an exception if unable to calculate requested rate.
  # Raises an exception if there is no rate for the date provided.
  def self.rate(date, from_currency, to_currency)
    # TODO: calculate and return rate
    validation = self.validateInput(date, from_currency, to_currency)
    if (validation[0])
      puts("Continue to get currency")
    else
      puts(validation[1])
    end
  end

  # Returns an array
  # [0] => boolean true is valid false is not valid
  # [1] => string information of state
  def self.validateInput(date, from_currency, to_currency)
  	if !date.instance_of?(Date)
      return [false, "Date not valid"]
    elsif !from_currency.instance_of?(String) || from_currency.length != 3
      return [false, "From currency not valid"]
    elsif !to_currency.instance_of?(String) || to_currency.length != 3
      return [false, "To currency not valid"]
    else
      return [true, "Valid"]
    end
  end

end
