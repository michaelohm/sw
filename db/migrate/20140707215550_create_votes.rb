class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
    	t.references :user
    	t.references :image
    	t.boolean :voted, default: false #don't need this anymore the way I keep track of votes. will change it to show whether the vote was an upvote or downvote.
    	t.timestamps
    end
  end
end
