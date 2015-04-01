class AcknowledgementWorker
  include Sneakers::Worker

  def work(msg)
    params = JSON.parse(msg).with_indifferent_access

    # Here goes implementation
  end
end