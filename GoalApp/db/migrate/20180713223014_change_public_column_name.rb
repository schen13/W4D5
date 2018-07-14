class ChangePublicColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :goals, :public, :is_public
  end
end
