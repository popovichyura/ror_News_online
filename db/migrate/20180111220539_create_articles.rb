class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :shortbody
      t.string :body
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
