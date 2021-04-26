class CreateUserSymptoms < ActiveRecord::Migration[5.2]
  def change
    create_table :user_symptoms do |t|
      t.text :symptom_name
      t.integer :symptom_id
      t.integer :user_id
      t.timestamps
    end
  end
end
