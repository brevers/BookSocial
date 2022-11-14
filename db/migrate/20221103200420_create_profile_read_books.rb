class CreateProfileReadBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :profile_read_books do |t|
      t.integer :profile_id
      t.integer :book_id

      t.timestamps
    end
  end
end
