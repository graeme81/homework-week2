class Room

  def initialize()
    @guest_array = []
    @song_list = []
    @capacity = 3
    @money_taken = 0
  end

  def add_guest(guest)

    if @guest_array.count < 3
      @guest_array << guest
      guest.money -= 35
      @money_taken += 35
    else
      "Room is full!"
    end
  end

  def number_of_guests
    return @guest_array.count
  end

  def delete_guest()
    @guest_array.pop()
  end

  def add_song(song)
    @song_list << song
  end

  def number_of_songs
    return @song_list.count
  end

  def guest_likes_a_song(guest)

    # for song in @song_list
    #    if song.title == guest.fav_song[0] && song.artist == guest.fav_song[1]
    #      return "whoop"
    #    end
    # end

    found = @song_list.any? {|song| song.title == guest.fav_song[0] && song.artist == guest.fav_song[1]}
    
     if found 
      return "whoop"
     end
  end

  def money_taken
    return @money_taken
  end


end