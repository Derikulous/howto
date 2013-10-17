class CreateHowtos < ActiveRecord::Migration
  def change
    create_table :howtos do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
