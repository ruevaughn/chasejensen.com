require 'spec_helper'

describe StaticController do
  it "returns 200 OK" do
    get :home
    expect(response.status).to be(200)
  end
end
