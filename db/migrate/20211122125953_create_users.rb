class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :login
      t.string :full_name
      t.date :birthday
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.decimal :zip
      t.belongs_to :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
