require 'rails_helper'

RSpec.describe Fetcher do
  describe "#fetch_currencies" do
    it "fetches currencies and creates record if currencies table is empty" do
      expect{Fetcher.fetch_currencies}.to change{Currency.count}.by(1)
    end

    it "fetches currencies and creates record if last currency record is older than 1 hour" do
      Currency.create!(created_at: 2.hours.ago)
      expect{Fetcher.fetch_currencies}.to change{Currency.count}.by(1)
    end

    it "takes last fetched currency record if it isn't older than 1 hour" do
      currency = Currency.create!(created_at: 30.minutes.ago)
      res = Fetcher.fetch_currencies
      expect(res).to eq(currency)
    end
  end
end