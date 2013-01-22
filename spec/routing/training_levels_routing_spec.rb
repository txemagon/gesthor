require "spec_helper"

describe TrainingLevelsController do
  describe "routing" do

    it "routes to #index" do
      get("/training_levels").should route_to("training_levels#index")
    end

    it "routes to #new" do
      get("/training_levels/new").should route_to("training_levels#new")
    end

    it "routes to #show" do
      get("/training_levels/1").should route_to("training_levels#show", :id => "1")
    end

    it "routes to #edit" do
      get("/training_levels/1/edit").should route_to("training_levels#edit", :id => "1")
    end

    it "routes to #create" do
      post("/training_levels").should route_to("training_levels#create")
    end

    it "routes to #update" do
      put("/training_levels/1").should route_to("training_levels#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/training_levels/1").should route_to("training_levels#destroy", :id => "1")
    end

  end
end
