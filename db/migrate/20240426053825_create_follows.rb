class CreateFollows < ActiveRecord::Migration[7.0]
  def change
    create_table :follows do |t|
      t.bigint :follower_id
      t.bigint :followed_id

      t.timestamps
    end
  end
end
