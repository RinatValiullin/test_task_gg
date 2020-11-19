class CreateClientsCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :client_companies do |t|
      t.references :client, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
