class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :slug
      t.text :body

      t.timestamps
    end
    add_index :articles, :slug
  end
end
