class WordValidator
  attr_reader :find_word

  def initialize(word)
    @word = word
  end

  def find_word
    headers = {'app_id' => ENV['OED_APP_ID'], 'api_id' => ENV['OED_API_KEY']}
    @conn = Faraday.new(url: "https://od-api.oxforddictionaries.com/api/v1/entries/en/#{@word}") do |faraday|
    end
    response = @conn.get {|request| request.headers = headers}

    binding.pry
    JSON.parse(response.body, headers: true)
  end


end