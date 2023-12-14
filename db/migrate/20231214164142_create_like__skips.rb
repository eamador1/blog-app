class CreateLikeSkips < ActiveRecord::Migration[7.1]
  def change
    create_table :like__skips do |t|

      t.timestamps
    end
  end
end
