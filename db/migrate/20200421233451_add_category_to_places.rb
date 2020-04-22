class AddCategoryToPlaces < ActiveRecord::Migration[6.0]
  def change
    add_reference :places, :category, index: true
  end
end
