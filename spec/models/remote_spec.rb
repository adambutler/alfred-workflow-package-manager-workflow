describe Workflow::Remote do
  context "index" do
    it "returns an array" do
      expect(Workflow::Remote.index).to be_kind_of(Array)
    end
  end

  context "get" do
    it "returns an array" do
      expect(Workflow::Remote.get(1)).to be_kind_of(Hash)
    end
  end

  context "search" do
    it "returns an array" do
      expect(Workflow::Remote.search("testing")).to be_kind_of(Array)
    end
  end
end
