class CreateChoices < ActiveRecord::Migration[6.0]
  def change
    create_table :choices do |t|
      t.integer :id_user
      t.integer :chosen
      t.integer :read
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
