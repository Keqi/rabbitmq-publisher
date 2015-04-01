require 'rails_helper'

RSpec.describe Currency do
  describe "callbacks" do
    it "adds uuid to object before creation" do
      currency = Currency.new
      expect(currency.uuid).to be_nil

      currency.save
      expect(currency.uuid).not_to be_nil
    end
  end

  describe "scopes" do
    describe "#last_fetched" do
      it "sorts currency records by creation date and returns the newest" do
        old_currency = Currency.create!(created_at: 1.month.ago)
        new_currency = Currency.create!(created_at: 1.week.ago)

        expect(Currency.last_fetched).to eql(new_currency)
      end
    end
  end
end