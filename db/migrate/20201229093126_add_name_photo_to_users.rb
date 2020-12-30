class AddNamePhotoToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string ,after: :email
    add_column :users, :photo, :text ,after: :name
  end
end
