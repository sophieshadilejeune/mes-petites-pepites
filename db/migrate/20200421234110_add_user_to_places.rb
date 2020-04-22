class AddUserToPlaces < ActiveRecord::Migration[6.0]
  def change
    add_reference :places, :user, index: true
  end
end
