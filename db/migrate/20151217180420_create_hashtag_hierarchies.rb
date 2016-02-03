class CreateHashtagHierarchies < ActiveRecord::Migration
  def change
    create_table :hashtag_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :hashtag_hierarchies, [:ancestor_id, :descendant_id, :generations],
      unique: true,
      name: "hashtag_anc_desc_idx"

    add_index :hashtag_hierarchies, [:descendant_id],
      name: "hashtag_desc_idx"
  end
end
