class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    self.songs.length
  end

  def artist_count
    artists = []
    self.songs.each do |song|
      if !artists.include?(song.artist)
        artists << song.artist
      end
    end
    artists.length
  end

  def all_artist_names
    artists = []
    self.songs.each do |song|
      if !artists.include?(song.artist.name)
        artists << song.artist.name
      end
    end
    artists
  end
end
