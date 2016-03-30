class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string :name
      t.string :summary

      t.timestamps null: false
    end
  end
end
