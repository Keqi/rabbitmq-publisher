class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.json :rates
      t.string :uuid

      t.timestamps null: false
    end
  end
end
