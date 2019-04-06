class AddColumnPrivateGoalToGoals < ActiveRecord::Migration[5.2]
  def change
    add_column :goals, :private?, :boolean, default: false, null: false
  end
end
