class AddConsumerColumnsToCurrency < ActiveRecord::Migration
  def change
    add_column :currencies, :consumer1_ack, :boolean, default: false
    add_column :currencies, :consumer2_ack, :boolean, default: false
    add_column :currencies, :consumer3_ack, :boolean, default: false
  end
end
