class CreateSubsections < ActiveRecord::Migration
  def self.up
    create_table :subsections do |t|
      t.string :name
      t.references :section
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :subsections
  end
end
