class RemoveColumnDescriptionToPosition < ActiveRecord::Migration[6.1]
  def change
    remove_column :positions, :description
  end
end
