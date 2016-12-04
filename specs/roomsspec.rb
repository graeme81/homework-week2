require ('minitest/autorun')
require('minitest/rg')
require_relative('../rooms')
require_relative('../guests')
require_relative('../songs')


class RoomSpec < MiniTest::Test 

  def test_can_create_room
    room = Room.new
    assert_equal(Room,room.class)
  end

  def test_can_add_guest_to_room
    room = Room.new
    guest = Guest.new("Jon", 100, ["People", "Awolnation"])
    room.add_guest(guest)
    assert_equal(1,room.number_of_guests)
    assert_equal(65,guest.money)
  end

  def test_guest_can_leave_room
    room = Room.new
    guest = Guest.new("Jon", 100, ["People", "Awolnation"])
    room.add_guest(guest)
    room.add_guest(guest)
    room.delete_guest()
    assert_equal(1,room.number_of_guests)
  end

  def test_add_song_to_room
    room = Room.new
    song1 = Songs.new("People", "Awolnation")
    #song2 = Songs.new("Bad Blood", "Bastille")
    #song3 = Songs.new("These Streets", "Bastille")
    room.add_song(song1)
    #room.add_song(song2)
    #room.add_song(song3)
    assert_equal(1,room.number_of_songs)
  end

  def test_room_cannot_exceed_capacity
    room = Room.new

    guest1 = Guest.new("Jon", 100, ["People", "Awolnation"] )
    guest2 = Guest.new("Ron", 90, ["People", "Awolnation"])
    guest3 = Guest.new("Rob", 85, ["People", "Awolnation"])
    guest4 = Guest.new("Bob", 120, ["People", "Awolnation"])

    room.add_guest(guest1)
    room.add_guest(guest2)
    room.add_guest(guest3)
    room.add_guest(guest4)

    assert_equal(3,room.number_of_guests)
    assert_equal("Room is full!",room.add_guest(guest4))
  end

  def test_guest_finds_favourite_song
    room = Room.new
    guest1 = Guest.new("Jon", 100, ["Bad Blood", "Bastille"])
    guest2 = Guest.new("Ron", 100, ["People", "Awolnation"])
    song1 = Songs.new("People", "Awolnation")
    song2 = Songs.new("Bad Blood", "Bastille")
    song3 = Songs.new("These Streets", "Bastille")

    room.add_guest(guest1)
    room.add_song(song1)
    room.add_song(song2)
    room.add_song(song3)

    assert_equal(3, room.number_of_songs)
    assert_equal(1, room.number_of_guests)

    assert_equal("whoop", room.guest_likes_a_song(guest1))
    assert_equal("whoop", room.guest_likes_a_song(guest2))
  end

end