class TicketsRespostas < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets_respostas do |t|
      t.integer :attendant_id
      t.integer :ticket_id
      t.string :content

      t.timestamps
    end
  end
end
