class Article
    @@all = []
    attr_reader :magazine, :title, :author

    def initialize( author, magazine, title)
        @author = author
        @magazine = magazine
        @title = title
    end

    def title
        @title
    end

    def self.all
        @@all
        
    end

    def author
		@author
	end

    
	def magazine
	 	@magazine
	end


end
