class WordValidator
  attr_reader :find_word

  def initialize(word)
    @word = word
  end

  def find_word
    headers = {'app_id' => ENV['OED_APP_ID'], 'api_id' => ENV['OED_API_KEY']}
    @conn = Faraday.new(url: "https://od-api.oxforddictionaries.com/api/v1/entries/en/#{@word}") do |faraday|
      faraday.headers = headers
      faraday.adapter  Faraday.default_adapter
    end
    response = @conn.get
    binding.pry
    JSON.parse(response.body, headers: true)
  end


end