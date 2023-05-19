require 'net/http'
require 'json'
require 'uri'


url = 'https://www.jma.go.jp/bosai/forecast/data/overview_forecast/130000.json'
responce = Net::HTTP.get(url)

res_json = JSON.parse(response.body)

puts '発表者' : 'res_json.publishingOffice',  '報告日時' : 'res_json.reportDatetime', '対象地域' : 'res_json.targetArea, 'ヘッドライン' : 'res_json.headlineText', '詳細' : 'res_json.trxt'