class CreateLogins < ActiveRecord::Migration
  def self.up
    create_table :logins do |t|
      t.string :username
      t.text :password
      t.text :level

      t.timestamps
    end
  end

  def self.down
    drop_table :logins
  end
end