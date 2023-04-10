class AddUserToMissions < ActiveRecord::Migration[7.0]
  def change
    add_reference :missions, :user, foreign_key: true, index: true
  end
end
