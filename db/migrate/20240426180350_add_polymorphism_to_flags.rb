class AddPolymorphismToFlags < ActiveRecord::Migration[7.0]
  def change
    remove_reference :flags, :post, index: true, foreign_key: true
    add_reference :flags, :flaggable, polymorphic: true, index: true
    end
end
