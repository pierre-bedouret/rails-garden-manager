class AddColumnsToPlants < ActiveRecord::Migration[5.2]
  def change
    add_column :plants, :category, :string
    add_column :plants, :area, :string
    add_column :plants, :fruit, :boolean
    add_column :plants, :flower_color, :string
    add_column :plants, :max_size, :integer
    add_column :plants, :lifetime, :integer
  end
end
