class CreateGeners < ActiveRecord::Migration[6.0]
  def change
    create_table :geners do |t|
      t.string :name

      t.timestamps
    end
  end
end
