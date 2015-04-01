class AcknowledgementWorker
  include Sneakers::Worker

  def work(msg)
    params = JSON.parse(msg).with_indifferent_access

    c = Currency.find_by(uuid: params.fetch(:uuid))
    c.toggle("consumer#{params.fetch(:id)}_ack")
  end
end