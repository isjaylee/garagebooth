class InitialSchema < ActiveRecord::Migration
  def change
    create_table :booths do |t|
      t.string    :name
      t.string    :address1
      t.string    :address2
      t.string    :city
      t.string    :state
      t.string    :zipcode
      t.string    :email
      t.string    :phone
      t.integer   :uid, index: { unique: true}
      t.text      :description
      t.datetime  :start_date
      t.datetime  :stop_date
      t.timestamps
    end

    create_table :items do |t|
      t.string  :name
      t.text    :description
      t.decimal :price
      t.timestamps
    end

    create_table :categories do |t|
      t.string :name
    end

    add_reference :booths, :user, index: true
    add_reference :items, :booth, index: true
    add_reference :items, :category, index: true
  end
end
