
namespace :load do
  task data: :environment do

    require 'uri'
    require 'net/http'
    require 'openssl'

    url = URI("https://tvjan-tvmaze-v1.p.rapidapi.com/schedule?filter=primetime&per_page=100")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'tvjan-tvmaze-v1.p.rapidapi.com'
    request["x-rapidapi-key"] = '3e1422a835msh3dbafba78dbbe05p15a684jsn28d4bab30f4b'

    response = http.request(request)
    results = JSON.parse(response.read_body)
    10.times do |x|
      Channel.create(name: "Channel_#{x}")
    end
    ids = Channel.all.pluck(:id)
    results.each do |data|
      Show.create(name: data['show']['name'], channel_id: ids.sample, air_timing: data['airtime'], air_day: data['show']['schedule']['days'])
      puts data['show']['name']
    end

  end
end