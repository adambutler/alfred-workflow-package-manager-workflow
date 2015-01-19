require 'net/http'

def download_workflow(id)
  begin
    uri = URI("http://alfred-workflow-package-manager.dev/workflows/#{id}.json")

    # Create client
    http = Net::HTTP.new(uri.host, uri.port)

    # Create Request
    req =  Net::HTTP::Get.new(uri)

    # Fetch Request
    res = http.request(req)
    puts "Response HTTP Status Code: #{res.code}"
    puts "Response HTTP Response Body: #{res.body}"
  rescue Exception => e
    puts "HTTP Request failed (#{e.message})"
  end
end

download_workflow(1)
