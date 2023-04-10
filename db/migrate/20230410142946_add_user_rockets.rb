class AddUserRockets < ActiveRecord::Migration[7.0]
  def change
    add_reference  :rockets , :user, index: true
  end
end
