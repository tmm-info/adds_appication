require "rails_helper"

RSpec.describe AddsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/adds").to route_to("adds#index")
    end

    it "routes to #new" do
      expect(get: "/adds/new").to route_to("adds#new")
    end

    it "routes to #show" do
      expect(get: "/adds/1").to route_to("adds#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/adds/1/edit").to route_to("adds#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/adds").to route_to("adds#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/adds/1").to route_to("adds#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/adds/1").to route_to("adds#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/adds/1").to route_to("adds#destroy", id: "1")
    end
  end
end
