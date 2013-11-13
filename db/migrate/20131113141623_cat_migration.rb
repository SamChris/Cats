class CatMigration < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :name
      t.integer :age
      t.date :birth_date
      t.string :color
      t.string :sex

      t.timestamps
    end
    add_index(:cats, :name)
    add_index(:cats, :color)
  end
end
