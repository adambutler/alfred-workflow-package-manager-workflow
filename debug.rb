require 'rubygems'
require 'net/http'
require 'json'

def download_workflow(id)
  begin
    uri = URI("http://alfred-workflow-package-manager.dev/workflows/#{id}.json")

    # Create client
    http = Net::HTTP.new(uri.host, uri.port)

    # Create Request
    request =  Net::HTTP::Get.new(uri)

    # Fetch Request
    response = http.request(request)

    # Parse the response and get the git_repository_url
    git_repository_url = JSON.parse(response.body)["git_repository_url"]

    # Clone the git repository and write the output
    puts `git clone #{git_repository_url}`

  rescue Exception => e
    puts "HTTP Request failed (#{e.message})"
  end
end

download_workflow(1)
