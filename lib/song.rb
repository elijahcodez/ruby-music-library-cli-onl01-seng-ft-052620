require 'pry'

class Song
attr_accessor :name, :artist, :genre
@@all =[]

def initialize(name, artist= nil, genre= nil)
@name=name
self.artist=(artist) if artist != nil
self.genre=(genre) if genre !=nil
end

def self.create(name)
song = self.new(name)
song.save
song
end

def self.new_from_filename(file)
split_file = file.split(' - ')
artist = split_file[0]
artist = Artist.find_or_create_by_name(artist)
name = split_file[1]
genre = split_file[2].gsub('.mp3', '')
genre = Genre.find_or_create_by_name(genre)
song = self.new(name, artist, genre)
end

def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save
    song
end


def genre= (genre)
@genre = genre unless @genre
genre.add_song(self)
end

def artist= (artist)
@artist = artist unless @artist
artist.add_song(self)
end

def self.find_by_name(name)
    @@all.detect{|song| song if song.name == name}
end

def self.find_or_create_by_name(song)
    self.find_by_name(song) ? self.find_by_name(song) : self.create(song)
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