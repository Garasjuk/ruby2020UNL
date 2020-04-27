class CreateSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects do |t|
      t.string :topic
      t.string :description
      t.string :status

      t.timestamps
    end
  end
end
