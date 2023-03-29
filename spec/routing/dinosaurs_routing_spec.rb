require "rails_helper"

RSpec.describe DinosaursController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/dinosaurs").to route_to("dinosaurs#index")
    end

    it "routes to #new" do
      expect(get: "/dinosaurs/new").to route_to("dinosaurs#new")
    end

    it "routes to #show" do
      expect(get: "/dinosaurs/1").to route_to("dinosaurs#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/dinosaurs/1/edit").to route_to("dinosaurs#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/dinosaurs").to route_to("dinosaurs#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/dinosaurs/1").to route_to("dinosaurs#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/dinosaurs/1").to route_to("dinosaurs#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/dinosaurs/1").to route_to("dinosaurs#destroy", id: "1")
    end
  end
end
