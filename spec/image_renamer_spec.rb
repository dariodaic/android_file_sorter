require "./lib/image_renamer"

RSpec.describe Greeter do

  describe "greeting" do
    it "should greet with 'Hello!'" do
      expect(Greeter.new.hello).to eq("Hello!")
    end
  end

end
