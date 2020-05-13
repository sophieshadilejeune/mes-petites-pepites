class AddCitytoCategories < ActiveRecord::Migration[6.0]
  def change
        add_reference :categories, :city, index: true

  end
end
