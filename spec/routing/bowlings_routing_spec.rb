require "spec_helper"

describe BowlingsController do
  describe "routing" do
    it "routes to #index" do
      expect(get("/bowlings")).to route_to("bowlings#index")
    end

    it "routes to #new" do
      expect(get("/bowlings/new")).to route_to("bowlings#new")
    end

    it "routes to #calculate" do
      expect(post("/bowlings/calculate")).to route_to("bowlings#calculate")
    end
  end
end
