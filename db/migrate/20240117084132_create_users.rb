class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :exam_id

      t.timestamps
    end

    add_index :users, [:exam_id], name: 'index_users_on_exam_id'

    create_table :colleges do |t|
      t.string :college_name

      t.timestamps
    end

    create_table :exams do |t|
      t.string :exam_name
      t.string :college_id

      t.timestamps
    end

    create_table :exam_windows do |t|
      t.string :exam_id
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
