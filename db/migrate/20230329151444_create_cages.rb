class CreateCages < ActiveRecord::Migration[7.0]
  def change
    create_table :cages do |t|
      t.string :name
      t.integer :power_status, default: 0
      t.integer :max_occupancy

      t.timestamps
    end
  end
end
