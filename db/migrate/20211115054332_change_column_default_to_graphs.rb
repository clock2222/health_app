class ChangeColumnDefaultToGraphs < ActiveRecord::Migration[6.1]
  def change
    change_table :graphs, bulk: true do |t|
      t.change_default :graph_a, from: nil, to: "0"
      t.change_default :graph_b, from: nil, to: "0"
      t.change_default :graph_c, from: nil, to: "0"
      t.change_default :graph_d, from: nil, to: "0"
      t.change_default :graph_e, from: nil, to: "0"
      t.change_default :graph_f, from: nil, to: "0"
    end
  end
end
