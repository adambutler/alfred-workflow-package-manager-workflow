module Workflow
  class Remote

    def self.index(query = nil)
      url = "#{HOST}/workflows.json"
      url = "#{url}?query=#{query}" if query
      uri = URI(url)
      http = Net::HTTP.new(uri.host, uri.port)
      request =  Net::HTTP::Get.new(uri)
      workflows = JSON.parse(http.request(request).body)
      return workflows
    end

    def self.get(id)
      uri = URI("#{HOST}/workflows/#{id}.json")
      http = Net::HTTP.new(uri.host, uri.port)
      request =  Net::HTTP::Get.new(uri)
      workflow = JSON.parse(http.request(request).body)
      return workflow
    end

    def self.search(query)
      self.index(query)
    end
  end
end
