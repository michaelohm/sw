class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
    	t.references :user
    	t.string :description
    	t.integer :votecount, :default => 0
    	t.timestamps
    end
  end
end
