class CreateRockets < ActiveRecord::Migration[7.0]
  def change
    create_table :rockets do |t|
      t.string :name
      t.string :description
      t.string :status
      t.string :image

      t.timestamps
    end
  end
end
