class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes do |t|
      t.belongs_to :user, index: true
      t.belongs_to :post, index: true

      t.timestamps
    end
  end
end
