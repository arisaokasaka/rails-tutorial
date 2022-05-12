class AddStatusToCommennts < ActiveRecord::Migration[5.2]
  def change
    add_column :commennts, :status, :string
  end
end
