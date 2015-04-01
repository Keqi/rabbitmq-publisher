class Currency < ActiveRecord::Base
  before_create :set_uuid

  scope :last_fetched, -> { order("created_at DESC").first }

  private

  def set_uuid
    begin
      self.uuid = SecureRandom.uuid
    end while Currency.exists?(uuid: uuid)
  end
end
