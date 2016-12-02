class CreateAllTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name, unique: true

      t.timestamps
    end

    create_table :polls do |t|
      t.string :title
      t.integer :author_id, null: false

      t.timestamps
    end

    create_table :questions do |t|
      t.integer :poll_id, null: false
      t.text :text

      t.timestamps
    end

    create_table :answer_choices do |t|
      t.integer :question_id, null: false
      t.text :text

      t.timestamps
    end

    create_table :responses do |t|
      t.integer :user_id, null: false
      t.integer :answer_choice_id, null: false

      t.timestamps
    end

    add_index :polls, :author_id
    add_index :questions, :poll_id
    add_index :answer_choices, :question_id
    add_index :responses, [:user_id, :answer_choice_id]
  end
end
