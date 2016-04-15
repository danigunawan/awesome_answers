class AddUserReferencesToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :user, :string
  end
end
