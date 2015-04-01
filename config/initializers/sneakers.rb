Sneakers.configure  :heartbeat => 100,
                    :amqp => 'amqp://guest:guest@localhost:5672',
                    :vhost => '/',
                    :exchange => 'acknowledgements',
                    :exchange_type => :direct