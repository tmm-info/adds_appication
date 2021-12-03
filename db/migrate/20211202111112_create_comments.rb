class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :add_id
      t.integer :parent_id

      t.timestamps
    end
  end
end
