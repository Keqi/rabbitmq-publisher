require 'rails_helper'

RSpec.describe AcknowledgementWorker do
  describe "#work" do
    it "toggles consumer column to true if msg was acknowledged" do
      currency = Currency.create!(consumer1_ack: false)
      msg = { id: 1, uuid: currency.uuid }.to_json

      AcknowledgementWorker.new.work(msg)
      expect(currency.reload.consumer1_ack).to eq(true)
    end
  end
end