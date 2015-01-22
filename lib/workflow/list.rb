module Workflow
  class List
    def self.generate_xml(workflows)
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
      xml.join
    end
  end
end
