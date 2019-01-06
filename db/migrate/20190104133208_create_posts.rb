class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :book_title
      t.string :author
      t.string :publisher
      t.date :release
      t.text :sentence1
      t.text :sentence2
      t.text :sentence3
      t.text :supplement

      t.timestamps
    end
  end
end
