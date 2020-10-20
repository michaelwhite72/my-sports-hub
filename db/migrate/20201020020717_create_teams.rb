class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :logo
      t.string :league
      t.string :api_id
      t.string :api_used

      t.timestamps
    end
  end
end
