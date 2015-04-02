# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'sneakers/tasks'

Rails.application.load_tasks

namespace :rabbitmq do
  desc "Setup routing"
  task :setup do
    require "bunny"

    conn = Bunny.new
    conn.start

    ch = conn.create_channel

    # get or create exchange
    fanout = ch.fanout("currencies.fanout", durable: true)
    direct = ch.direct("currencies.direct", durable: true)

    # get or create queue (note the durable setting)
    queue1 = ch.queue("currencies.queue_1", durable: true)
    queue2 = ch.queue("currencies.queue_2", durable: true)
    queue3 = ch.queue("currencies.queue_3", durable: true)

    queue_acknowledgement = ch.queue("currencies.acknowledgements", durable: true)


    # bind queue to exchange
    queue1.bind("currencies.fanout")
    queue2.bind("currencies.fanout")
    queue3.bind("currencies.fanout")
    queue_acknowledgement.bind("currencies.direct", routing_key: "acknowledgements")

    conn.close
  end
end
