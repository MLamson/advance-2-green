class ChangeColumnNameStoryToGuidanceInGuidances < ActiveRecord::Migration
  def change
    rename_column :guidances, :story, :guidance
  end
end
