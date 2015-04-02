Sneakers.configure  :heartbeat => 100,
                    :amqp => 'amqp://guest:guest@localhost:5672',
                    :vhost => '/',
                    :exchange => 'currencies.direct',
                    :exchange_type => :direct