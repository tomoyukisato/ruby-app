class Product < ApplicationRecord
    validates :name, presence: true
    validates :pic , presence: true 
    validates :description , presence: true
    belongs_to :category
    has_many :comments
    
    def self.search(search) #ここでのself.はUser.を意味する
        if search
          where(['name LIKE ?', "%#{search}%"]) #検索とnameの部分一致を表示。User.は省略
        else
          all #全て表示。User.は省略
        end
    end
    def self.save(params,upload)
      logger.debug("if文の中に入りました")
      logger.debug(upload)

      name = upload['datafile'].original_filename
      directory = "app/assets/images"
      store_path = "assets/" + name
      # create the file path
      path = File.join(directory, name)
      logger.debug(path)
      # write the file
      File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
      create(name: params[:name], pic: store_path, category_id: params[:category_id], description: params[:description]  )
   end
end
