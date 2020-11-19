class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :email, default: "", null: false

      t.timestamps
    end
  end
end
