class AddCitytoPlaces < ActiveRecord::Migration[6.0]
  def change
    add_reference :places, :city, index: true

  end
end
