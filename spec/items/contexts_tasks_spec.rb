require_relative "../spec_helper"

describe Rubyfocus::ContextsTasks do
	before(:all) do
		@item = Rubyfocus::ContextsTasks.new(nil, xml(file: "contexts-tasks"))
	end

	describe "#initialize" do
		it "should extract relevant data from the node" do
      expect(@item.id).to eq("h0-L40WzHLv.fh-A78PzERu")
      expect(@item.task_id).to eq("h0-L40WzHLv")
      expect(@item.context_id).to eq("fh-A78PzERu")
		end
	end
	describe "#context" do
		it "should extract relevant data from the node" do
      d = Rubyfocus::Document.new
      @item = Rubyfocus::ContextsTasks.new(d, xml(file: "contexts-tasks"))
      @context = Rubyfocus::Context.new(d, xml(file: "context-parent"))
      expect(@item.context.id).to eq("fh-A78PzERu")
		end
	end

	describe "#inspect" do
	  it "should form a well-made inspector" do
	    inspect_string = @item.inspect
	    expect(inspect_string).to start_with("#<Rubyfocus::ContextsTasks")
	    expect(inspect_string).to end_with(">")
	  end
	end
end
