class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :customer_id
      t.text :indentifier
      t.text :secret

      t.timestamps
    end
  end
end
