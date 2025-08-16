class ChangeBodyToTextInUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :body, :text
  end
end
