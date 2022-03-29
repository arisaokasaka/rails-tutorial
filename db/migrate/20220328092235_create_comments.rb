class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :article, foreign_key: true
      #↑article_idという名前のinteger型カラムとそのインデックス、articlesのidカラムを指す外部キー制約を設定する。リレーションシップを簡単に宣言できる。

      t.timestamps
    end
  end
end
