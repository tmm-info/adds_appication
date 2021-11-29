class CreateAdds < ActiveRecord::Migration[6.1]
  def change
    create_table :adds do |t|
      t.string :title
      t.string :body
      t.string :img
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
