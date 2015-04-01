class Fetcher
  def self.fetch_currencies
    @response ||= begin
      res = Typhoeus.get("http://openexchangerates.org/api/latest.json?app_id=#{app_id}")
      JSON.parse(res.body).symbolize_keys
    end
  end

  private

  def self.app_id
    "9eb386cd27ba4ce6b262857802357e46"
  end
end