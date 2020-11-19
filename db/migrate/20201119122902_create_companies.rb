class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :subject, default: "", null: false
      t.text :message, default: "", null: false

      t.timestamps
    end
  end
end
