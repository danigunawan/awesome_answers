class AddViewCountToQuestion < ActiveRecord::Migration
  def change
    #you can find more info in method in here:
    #http://edgeguides.rubyonrails.org/active_record_migrations.html
    #THIS Migration adds a column
    add_column :questions, :view_count, :integer
  end
end
