class CreateCampers < ActiveRecord::Migration[6.1]
  def change
    create_table :campers do |t|
      t.integer :age
      t.string :name
      t.timestamps
    end
  end
end
