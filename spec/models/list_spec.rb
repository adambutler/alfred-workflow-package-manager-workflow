describe Workflow::List do
  context "generate_xml" do
    it "returns an array" do
      workflows = [
        {
          "id" => 1,
          "title" => "test"
        }
      ]

      expected_xml = """<?xml version='1.0'?>
      <items>
        <item uid='test' arg='1' autocomplete='test'>
          <title>test</title>
          <icon>workflow.png</icon>
        </item>
      </items>"""


      xml = Workflow::List.generate_xml(workflows)

      xml_formatted = xml.gsub(/\n\t/, " ").gsub!(/>\s*</, "><")
      expected_xml_formatted = expected_xml.gsub(/\n\t/, " ").gsub!(/>\s*</, "><")

      expect(xml_formatted).to eq(expected_xml_formatted)
    end
  end
end
