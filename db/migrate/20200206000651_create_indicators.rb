class CreateIndicators < ActiveRecord::Migration[5.2]
  def change
    create_table :indicators do |t|
      t.string :label
      t.string :indicator_search

      t.timestamps
    end
  end
end
