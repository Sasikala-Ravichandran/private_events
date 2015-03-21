class AddCreatorRefToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :creator, index: true
    add_foreign_key :events, :creators
  end
end
