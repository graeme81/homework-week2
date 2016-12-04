require ('minitest/autorun')
require('minitest/rg')
require_relative('../songs')

class SongSpec < MiniTest::Test 

  def test_song_has_a_title
    song = Songs.new("Heroes","Bowie")
    assert_equal("Heroes", song.title)
  end

  def test_song_has_an_artist
    song = Songs.new("Heroes","Bowie")
    assert_equal("Bowie", song.artist)
  end

end
