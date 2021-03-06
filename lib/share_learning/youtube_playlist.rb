require_relative 'youtube_api' 

module YouTube
  # Playlist on Youtube
  class YouTubePlaylist
    attr_reader :results

    def initialize(data: nil)
      @results = load_data(data)
    end

    def self.find(keyword:)
      playlists = YouTube::YouTubeAPI.get_playlist(keyword)
      new(data: playlists)
    end

    private

    # Get information of playlists 
    def load_data(playlists)
      results = []
      playlists['items'].each do |playlist|
        playlistId = playlist['id']['playlistId']
        title = playlist['snippet']['title']
        des = playlist['snippet']['description']
        # image = playlist['snippet']['thumbnails']['high']['url']
        if playlist['snippet']['thumbnails']['high']['url'].nil?
          image = ''
        else
          image = playlist['snippet']['thumbnails']['high']['url']
        end
        playlistId = playlist['id']['playlistId']
        url = 'https://www.youtube.com/playlist?list=' + playlistId
        results.push({'playlistId' => playlistId, 'title' => title, 'description' => des, 'image' => image, 'url' => url})
      end
      results
    end
  end
end
