require 'rails_helper'

RSpec.describe Publisher do
  describe "#publish" do
    it "returns instance of bunny queue" do
      expect(Publisher.publish.class).to eq(Bunny::Queue)
    end
  end
end