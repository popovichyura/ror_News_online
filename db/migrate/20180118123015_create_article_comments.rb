class CreateArticleComments < ActiveRecord::Migration[5.1]
  def change
    create_table :article_comments do |t|
      t.integer :article_id
      t.integer :user_id
      t.string :text

      t.timestamps
    end
  end
end
