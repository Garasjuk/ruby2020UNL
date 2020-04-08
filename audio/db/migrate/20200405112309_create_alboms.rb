class CreateAlboms < ActiveRecord::Migration[6.0]
  def change
    create_table :alboms do |t|
      t.string :name
      t.string :description
      t.string :image
      t.references :group, null: false, foreign_key: true
      t.references :artist, null: false, foreign_key: true
      t.references :gener, null: false, foreign_key: true

      t.timestamps
    end
  end
end
