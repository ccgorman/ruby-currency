# These are just suggested definitions to get you started.  Please feel
# free to make any changes at all as you see fit.


# http://test-unit.github.io/
require 'test/unit'
require 'currency_exchange'
require 'date'

class CurrencyExchangeTest < Test::Unit::TestCase
  def setup
  end

  def test_validate_input_date_is_not_valid
    assert_raise_message("The date is not valid") do
      CurrencyExchange.rate(12345, "GBP", "USD")
    end
  end

  def test_validate_input_from_currency_fails_as_number
    assert_raise_message("The from currency not valid") do
      CurrencyExchange.rate(Date.new(2018,11,22), 123, "USD")
    end
  end

  def test_validate_input_to_currency_fails_as_number
    assert_raise_message("The to currency not valid") do
      CurrencyExchange.rate(Date.new(2018,11,22), "USD", 123)
    end
  end

  def test_validate_input_from_currency_fails_as_two_chars
    assert_raise_message("The from currency not valid") do
      CurrencyExchange.rate(Date.new(2018,11,22), "US", "USD")
    end
  end

  def test_validate_input_to_currency_fails_as_four_chars
    assert_raise_message("The to currency not valid") do
      CurrencyExchange.rate(Date.new(2018,11,22), "USD", "USof")
    end
  end

  def test_find_rates_by_date_fails_date_not_included
    assert_raise_message("No rates could be found for that date") do
      CurrencyExchange.rate(Date.new(2000,11,22), "USD", "GBP")
    end
  end

  def test_calculate_rate_fails_from_not_in_feed
    assert_raise_message("Rate is not in the feed") do
      CurrencyExchange.rate(Date.new(2018,11,22), "AAA", "GBP")
    end
  end

  def test_calculate_rate_fails_to_not_in_feed
    assert_raise_message("Rate is not in the feed") do
      CurrencyExchange.rate(Date.new(2018,11,22), "GBP", "AAA")
    end
  end

  def test_non_base_currency_exchange_is_correct
    correct_rate = 1.2870493690602498
    assert_equal correct_rate, CurrencyExchange.rate(Date.new(2018,11,22), "GBP", "USD")
  end

  def test_base_currency_exchange_is_correct
    correct_rate = 0.007763975155279502
    assert_equal correct_rate, CurrencyExchange.rate(Date.new(2018,11,22), "JPY", "EUR")
  end

  def test_base_currency_exchange_is_correct_reverse
    correct_rate = 128.8
    assert_equal correct_rate, CurrencyExchange.rate(Date.new(2018,11,22), "EUR", "JPY")
  end

  def test_return_float_one_to_one
    correct_rate = 1.0
    assert_equal correct_rate, CurrencyExchange.rate(Date.new(2018,11,22), "GBP", "GBP")
  end

  def test_return_euro_one_to_one
    correct_rate = 1.0
    assert_equal correct_rate, CurrencyExchange.rate(Date.new(2018,11,22), "EUR", "EUR")
  end

end
