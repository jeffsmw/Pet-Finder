class RemoveUnwantedData < ActiveRecord::Migration[5.0]
  def change
    remove_reference :messages, :conversation
    remove_column :messages, :read
    drop_table :conversations
  end
end
