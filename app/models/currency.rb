class Currency < ActiveRecord::Base
  before_create :set_uuid

  private

  def set_uuid
    begin
      self.uuid = SecureRandom.uuid
    end while Currency.exists?(uuid: uuid)
  end
end
