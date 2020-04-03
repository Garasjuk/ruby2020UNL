class CreateVotings < ActiveRecord::Migration[6.0]
  def change
    create_table :votings do |t|
      t.string :rating
      t.references :photo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
