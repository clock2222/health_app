class RenameAllColumnToGraphs < ActiveRecord::Migration[6.1]
  def change
    change_table :graphs, bulk: true do |t|
      t.rename :pain, :graph_a
      t.rename :fatigue, :graph_b
      t.rename :obesity, :graph_c
      t.rename :anxiety, :graph_d
      t.rename :insomnia, :graph_e
      t.rename :other, :graph_f
    end
  end
end
