class AcknowledgementWorker
  include Sneakers::Worker

  from_queue "currencies.acknowledgements"

  def work(msg)
    params = JSON.parse(msg).with_indifferent_access

    c = Currency.find_ by(uuid: params.fetch(:uuid))
    c.toggle("consumer#{params.fetch(:id)}_ack")
    c.save!

    ack!
  end
end