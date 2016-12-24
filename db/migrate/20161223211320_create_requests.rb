class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.string :request
      t.integer :count

      t.timestamps
    end
  end
end
