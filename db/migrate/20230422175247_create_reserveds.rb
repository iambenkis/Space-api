class CreateReserveds < ActiveRecord::Migration[7.0]
  def change
    create_table :reserveds do |t|
      t.references :user, null: false, foreign_key: true
      t.references :rocket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
