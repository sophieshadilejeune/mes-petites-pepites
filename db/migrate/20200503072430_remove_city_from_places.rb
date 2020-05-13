class RemoveCityFromPlaces < ActiveRecord::Migration[6.0]
  def change
    remove_column :places, :city_id
  end
end
