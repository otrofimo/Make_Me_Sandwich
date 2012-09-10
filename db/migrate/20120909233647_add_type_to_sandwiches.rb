class AddTypeToSandwiches < ActiveRecord::Migration
  def change
  	add_column :sandwiches, :filling_type, :string
  end
end
