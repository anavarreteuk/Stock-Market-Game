class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.string :username
      t.float :point
      t.timestamps
    end
  end
end
