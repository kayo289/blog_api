class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.integer :uid
      t.string :title
      t.string :summary
      t.text :detail

      t.timestamps
    end
  end
end