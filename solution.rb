# Please copy/paste all three classes into this file to submit your solution!

#Article class
class Article
    @@all = []
    attr_accessor :magazine, :title, :author

    def initialize( author, magazine, title)
        @author = author
        @magazine = magazine
        @title = title
        @@all << self
    end

    def self.all
        @@all   
    end

end

#Author class
class Author
    attr_reader :name
  
  
    def initialize(name)
      @name = name
    
    end
  
    def articles
      Article.all.filter do |article|
        article.author = self
      end
    end
  
    def magazines
      magazines = self.articles.map do |article|
        article.magazine
      end
      magazines.uniq
    end
  
    def add_article(magazine, title)
      Article.new(title, self, magazine)
    end
  
    def topic_areas
      self.magazines.map do |magazine|
        magazine.category
      end
      magazines.uniq
    end
  
  end

  
  #Mag Class
  class Magazine
    attr_accessor :name, :category
  
  
    def initialize(name, category)
      @name = name
      @category = category
      @all << self
  
    end
  
    def self.all
      @@all
    end
  
    def contributors
      mag_articles.map do |f_article|
        f_article.author
      end
    end
  
  #returns the first magazine object that matches
    def self.find_by_name(magazine_name)
      Magazine.all.find do |magazine|
        magazine.name == magazine_name
      end
    end
  
  #returns an array strings of the titles of all articles written for that magazine
    def article_titles
      mag_articles.map do |f_article|
        f_article.title
      end
    end
  
  
  #returns an array of authors who have written more than 2 articles for the magazine
    def contributing_authors
      self.contributors.filter do |author|
        author.articles.count > 2
      end
    end
  
  end
  

