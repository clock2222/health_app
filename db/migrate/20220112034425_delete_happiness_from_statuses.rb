class DeleteHappinessFromStatuses < ActiveRecord::Migration[6.1]
  def change
    remove_column :statuses, :happiness, :integer
    remove_column :statuses, :human_relationship, :integer
  end
end
