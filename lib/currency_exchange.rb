class CurrencyExchange

  require 'date'
  require 'json'

  @FEED = "./data/eurofxref-hist-90d.json"

  # Return the exchange rate between from_currency and to_currency on date as a float.
  # Raises an exception if unable to calculate requested rate.
  # Raises an exception if there is no rate for the date provided.
  def self.rate(date, from_currency, to_currency)
    # If the parameters provided does not validate display message
    validation = self.validate_input(date, from_currency, to_currency)
    rates = self.find_rates_by_date(date.to_s)
    self.calculate_rate(rates, from_currency, to_currency)
  end

  # Check parameters are valid that have been supplied
  # Sets global error state if fails
  def self.validate_input(date, from_currency, to_currency)
    if !date.instance_of?(Date)
      raise "The date is not valid" 
    elsif !from_currency.instance_of?(String) || from_currency.length != 3
      raise "The from currency not valid"
    elsif !to_currency.instance_of?(String) || to_currency.length != 3
      raise "The to currency not valid"
    end
  end

  # Loop through rate data to find by date
  # Sets global error state if date does not exist
  def self.find_rates_by_date(date)
    currency_file = File.read(@FEED)
    data = JSON.parse(currency_file)
    data.each do |item|
      if item[0] == date
        return item[1]
      end
    end
    raise "No rates could be found for that date"
  end

  # Check both currencies are valid and do the calculation
  # Sets global error state if currencies are not in the feed or not valid
  def self.calculate_rate(rates, from_currency, to_currency)
    # During testing I did not account for EUR as a base currency, best thing about testing
    if from_currency == "EUR" && to_currency == "EUR"
      1.0
    elsif from_currency == "EUR" && rates.include?(to_currency)
      rates[to_currency].to_f
    elsif to_currency == "EUR" && rates.include?(from_currency) && rates[from_currency]
      1.0 / rates[from_currency]
    elsif rates.include?(from_currency) && rates.include?(to_currency) && rates[from_currency]
      # If they are both an Int then it will return an Int, only one needs to be a float to return a float
      rates[to_currency].to_f / rates[from_currency]
    else
      raise "Rate is not in the feed"
    end
  end

end
