class InstallMailkick < ActiveRecord::Migration[5.1]
  def change
    create_table :mailkick_opt_outs do |t|
      t.string :email
      t.integer :subscriber_id
      t.string :subscriber_type
      t.boolean :active, null: false, default: true
      t.string :reason
      t.string :list
      t.timestamps
    end

    add_index :mailkick_opt_outs, :email
    add_index :mailkick_opt_outs, [:subscriber_id, :subscriber_type]
  end
end
