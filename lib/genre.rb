class Genre
    extend Concerns::Findable
    attr_accessor :name
    @@all =[]
    
    def initialize(name)
    @name=name
    @songs =[]
    end
    
    def self.create(name)
        genre = self.new(name)
        genre.save
        genre
    end

    def artists
        @songs.map{|song| song.artist if song.genre == self}.uniq
    end

    def add_song(song)
        song.genre= self unless song.genre == self
        @songs << song unless self.songs.include?(song)
    end
    
    def songs
        @songs
    end
    
    def self.all
        @@all
    end
    
    def save
        @@all<<self
    end
    
    def self.destroy_all
    @@all.clear
    end
end