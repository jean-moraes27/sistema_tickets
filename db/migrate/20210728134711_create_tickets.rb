class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.integer :opened_by
      t.integer :attendant
      t.integer :type
      t.integer :status
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
