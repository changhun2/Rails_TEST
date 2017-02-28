class ChageArticle < ActiveRecord::Migration[5.0]
  def change
    change_table :articles do |t|
      t.references :user, foreign_key: true, after: :text
    end
  end
end
