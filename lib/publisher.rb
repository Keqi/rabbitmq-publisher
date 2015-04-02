class Publisher
  def self.publish
    message = Fetcher.fetch_currencies
    (1..3).each { |i| queue("currencies.queue_#{i}").publish(message.to_json) }
  end

  private

  def self.queue(queue_name)
    channel.queue(queue_name, durable: true)
  end

  def self.channel
    @channel ||= connection.create_channel
  end

  def self.connection
    @connection ||= Bunny.new(credentials).tap { |c| c.start }
  end

  def self.credentials
    "amqp://guest:guest@localhost:5672"
  end
end