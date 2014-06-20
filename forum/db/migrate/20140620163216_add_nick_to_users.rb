class AddNickToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nick, :string,:null => false,:unique=>true,:default=>"anonymous"
  end
end
