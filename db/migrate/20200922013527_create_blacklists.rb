class CreateBlacklists < ActiveRecord::Migration[5.2]
  def change
    create_table :blacklists do |t|
      t.string :cpf
      t.boolean :active

      t.timestamps
    end
  end
end
