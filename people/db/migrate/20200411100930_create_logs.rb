class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.string :name
      t.string :name_before
      t.string :kind
      t.string :kind_before

      t.timestamps
    end
  end
end
