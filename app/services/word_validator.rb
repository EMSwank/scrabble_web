class WordValidator
  attr_reader :find_word

  def initialize(word)
    @word = word
    @conn = Faraday.new(url: "https://od-api.oxforddictionaries.com/api/v1/entries/en/#{word}") do |faraday|
      faraday.headers["app_id"] = ENV["OED_APP_ID"]
      faraday.headers["api_id"] = ENV["OED_API_ID"]
      faraday.adapter  Faraday.default_adapter
    end
  end

  def find_word
    headers = {'app_id' => ENV['OED_APP_ID'], 'app_key' => ENV['OED_API_KEY']}
    response = @conn.get {|request| request.headers = headers}

    binding.pry
    JSON.parse(response.body, headers: true)
  end


end