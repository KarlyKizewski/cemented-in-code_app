class CreateGhosts < ActiveRecord::Migration[5.2]
  def change
    create_table :ghosts do |t|
      t.string :person
      t.text :eulogy
      t.timestamps
    end
  end
end
