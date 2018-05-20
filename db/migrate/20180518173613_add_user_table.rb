class AddUserTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string      :first_name
      t.string      :last_name
      t.date        :dob
      t.json        :spouse
      t.json        :child

      t.timestamps null: false
    end
  end
end
