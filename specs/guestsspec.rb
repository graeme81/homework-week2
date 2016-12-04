require ('minitest/autorun')
require('minitest/rg')
require_relative('../guests')

class GuestSpec < MiniTest::Test 

  def test_guest_has_a_name
    guest = Guest.new("Rod", 120, ["S.O.B", "Nathanial Ratecliff"])
    assert_equal("Rod", guest.name)
  end

  def test_guest_has_money
    guest = Guest.new("Jane", 120, ["Toes", "Zack Brown Band"])
    assert_equal(120, guest.money)
  end

  def test_guest_has_a_favourite_song
    guest = Guest.new("Freddy", 100, ["Hope", "Thirsty Merc"])
    assert_equal(["Hope", "Thirsty Merc"], guest.fav_song)
  end


end
