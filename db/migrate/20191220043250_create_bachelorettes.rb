class CreateBachelorettes < ActiveRecord::Migration[7.0]
  def change
    create_table :bachelorettes do |t|
      t.string :name
      t.integer :season_number
      t.string :description

      t.timestamps
    end
  end
end
