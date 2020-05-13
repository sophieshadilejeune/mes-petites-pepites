class RemoveCityToCategories < ActiveRecord::Migration[6.0]
  def change
    remove_column :categories, :city_id

  end
end
