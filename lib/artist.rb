require 'pry'


# Artist
#   #initialize with #name
#     accepts a name for the artist
#   #name=
#     sets the artist name

class Artist 

    @@all = []

    attr_accessor :name


    def initialize(name)
        @name = name 
        save
    end 

    def save
        @@all << self
    end 


    # .all
    # returns all existing Artist instances
    def self.all 
        @@all
    end 


    #   #songs
    #   lists all songs that belong to this artist
    def songs 
        Song.all.select do |song|
            song.artist == self 
        end 
    end 

    #   #add_song
    #   keeps track of an artist's songs
    def add_song(song) 
        song.artist = self #unless song.artist == self 
    end 

    # .find_or_create_by_name
    # always returns an Artist instance
    # finds or creates an artist by name maintaining uniqueness of objects by name property
    # Creates new instance of Artist if none exist

    def self.find_or_create_by_name(name)
        self.all.find {|artist| artist.name = name} || self.new(name)
    end 

    #   #print_songs
    #   lists all of the artist's songs

    def print_songs
        self.songs.collect {|song| puts song.name}

    end 
end 