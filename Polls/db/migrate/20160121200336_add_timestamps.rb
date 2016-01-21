class AddTimestamps < ActiveRecord::Migration
  def change
    add_column :questions, :created_at, :datetime
    add_column :questions, :updated_at, :datetime
    add_column :answer_choices, :created_at, :datetime
    add_column :answer_choices, :updated_at, :datetime
    add_column :responses, :created_at, :datetime
    add_column :responses, :updated_at, :datetime
  end
end
