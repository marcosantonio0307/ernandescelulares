class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :client
      t.string :fone
      t.string :address
      t.string :description
      t.decimal :value
      t.string :delivery
      t.string :status

      t.timestamps
    end
  end
end
