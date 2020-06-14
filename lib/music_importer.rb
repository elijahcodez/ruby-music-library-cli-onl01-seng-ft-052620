class MusicImporter
    attr_accessor :path
        @@all = []
        def initialize(file_path)
            @path =file_path
            save
        end
    
        def files
            files = Dir.entries(@path)
            mp3 = files.map{|file| file if file.match(/.mp3/)}.select{|k| k}
            mp3
        end
    
        def import
            new_songs= files.map{|file| file.gsub('.mp3', '')}
            new_songs.each{|song| Song.new_by_filename(song)}
        end
    
        def import
            files.each{|file| Song.create_from_filename(file)}
            
        end
    
        def save 
            @@all << self
        end
    
        def self.all
            @@all
        end
    
    end