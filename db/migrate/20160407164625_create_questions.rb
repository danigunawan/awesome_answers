#this file doesnt auto create the table, it just defines how the table must be
# created to execute it you will need to run: bin/rake db:migrate
class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      #you dont need to explicitely define the id field as it will be added
      #auto. Rails will add and 'id' field that is an integer and primary key
      #with 'autoincrement'
      t.string :title
      t.text :body

      #timestamps will add two extra fields: created_at and updated_at
      #they will be of type datetime
      #they will be auto set by ActiveRecord
      t.timestamps null: false
    end
  end
end
