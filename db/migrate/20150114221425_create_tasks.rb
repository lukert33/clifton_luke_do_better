class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :description, null: false
      t.boolean :completed, :default => false
    end
  end
end
