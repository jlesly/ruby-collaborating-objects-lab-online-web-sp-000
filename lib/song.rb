class Song
  attr_accessor :name, :artist

 def self.all
    @@all
  end

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    artist, song = filename.split(" - ")
    new_song = self.new(song)
    new_song.artist_name = artist
    new_song
  end

def self.find_by_name(song_name)
    self.all.detect { |song|
      song.name == song_name
    }
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end
  
   def print_songs
    songs.each { |song| puts song.name }
  end
end