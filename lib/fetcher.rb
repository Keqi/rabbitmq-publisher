class Fetcher
  def self.fetch_currencies
    currency = Currency.last_fetched
    return create_currency unless currency

    currency.created_at < 1.hour.ago ? create_currency : currency
  end

  private

  def self.create_currency
    Currency.create!(rates: JSON.parse(fetch_data.body)["rates"])
  end

  def self.fetch_data
    Typhoeus.get("http://openexchangerates.org/api/latest.json?app_id=#{app_id}")
  end

  def self.app_id
    "9eb386cd27ba4ce6b262857802357e46"
  end
end