class AddNodeIdToLists < ActiveRecord::Migration
  def change
    add_column :lists, :node_id, :integer
  end
end
