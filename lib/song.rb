require 'pry'


# Song
#   #initialize with a name
#     accepts a name for the song and makes it accessible through an attribute accessor
#   #name=
#     sets the song name
#   #artist=
#     sets the artist object to belong to the song

class Song 

    @@all = []

    attr_accessor :name, :artist

    def initialize(name)
        @name = name 
        save
    end 

    def save
        @@all << self
    end 

    # .all
    # returns all existing Song instances

    def self.all 
        @@all
    end
    
    # .new_by_filename
    # creates a new instance of a song from the file that's passed
    # associates new song instance with the artist from the filename


    def self.new_by_filename(file)
        artist_name = file.split(" - ")[0]
        song_name = file.split(" - ")[1]
        song = Song.new(song_name)
        song.artist_name = artist_name
        song
     #   binding.pry
    end

    #  #artist_name=
    #  accepts an artist's name, finds or creates an Artist 
    #  instance and assigns it to the Song's artist attribute


    def artist_name=(name)
        artist = Artist.find_or_create_by_name(name)
        self.artist = artist
        artist.add_song(self)
  end

end 