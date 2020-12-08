class AddPlayedToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :played, :boolean, default: false
  end
end
