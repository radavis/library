class CreateCategorizations < ActiveRecord::Migration
  def up
    create_table :categorizations, :id => false do |t|
      t.integer :book_id
      t.integer :category_id
    end

    add_index :categorizations, [:category_id, :book_id]
  end

  def down
    drop_table :categorizations
  end

end
