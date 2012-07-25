class AddStuffToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :body_type, :string, default: "no answer"
    add_column :profiles, :height, :integer, default: 65
    add_column :profiles, :ethnicity, :string, default: "no answer"
    add_column :profiles, :smokes, :string, default: "no answer"
    add_column :profiles, :drinks, :string, default: "no answer"
    add_column :profiles, :religion, :string, default: "no answer"
    add_column :profiles, :income, :string, default: "no answer"
    add_column :profiles, :job, :string, default: "no answer"
    add_column :profiles, :language, :string, default: "no answer"
    add_column :profiles, :drugs, :string, default: "no answer"
    add_column :profiles, :offspring, :string, default: "no answer"
    add_column :profiles, :exercise, :string, default: "no answer"
  end
end
