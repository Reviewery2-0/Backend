class CreateBreweries < ActiveRecord::Migration[6.1]
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :location
      t.integer :likes
      
      t.timestamps
    end
  end
end
