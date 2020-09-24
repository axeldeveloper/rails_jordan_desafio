class CreateSearchlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :searchlogs do |t|
      t.string :cpf
      t.string :situation
      t.references :blacklist, foreign_key: true

      t.timestamps
    end
  end
end
