class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :slug
      t.text :body
      t.boolean :published
      t.date :published_at

      t.timestamps
    end
    add_index :articles, :slug
  end
end
