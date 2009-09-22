class AddContentToSubsections < ActiveRecord::Migration
  def self.up
    add_column :subsections, :content, :text
  end

  def self.down
    remove_column :subsections, :content
  end
end
