require 'rubygems'
require 'net/http'
require 'json'

def generate_xml(workflows)
  xml = []
  xml << "<?xml version='1.0'?><items>"

  if workflows.empty?
    xml << """
      <item valid='no'>
        <title>No results</title>
      </item>"""
  else
    workflows.each do |workflow|
      xml << """
        <item uid='#{workflow["title"]}' arg='#{workflow["id"]}' autocomplete='#{workflow["title"]}'>
          <title>#{workflow["title"]}</title>
          <icon>workflow.png</icon>
        </item>"""
    end
  end

  xml << "</items>"
  puts xml.join
end

def search(query)
  begin
    uri = URI("http://alfred-workflow-package-manager.dev/workflows.json?query=#{query}")

    # Create client
    http = Net::HTTP.new(uri.host, uri.port)

    # Create Request
    request =  Net::HTTP::Get.new(uri)

    # Fetch Request
    response = http.request(request)

    # Parse the response and get the git_repository_url
    workflows = JSON.parse(response.body)

    # Generate the XML list of workflows
    generate_xml(workflows)

  rescue Exception => e
    puts "HTTP Request failed (#{e.message})"
  end
end

search(ARGV[0])
