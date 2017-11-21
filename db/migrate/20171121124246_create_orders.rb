class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :treatment, foreign_key: true, index: true
      t.references :appointment, foreign_key: true, index: true
    end
  end
end
