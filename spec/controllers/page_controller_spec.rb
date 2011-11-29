require 'spec_helper'

describe PageController do
  render_views

  describe "GET Home" do
    
    it "should have a successful home page" do
      get 'home'
      response.should be_success
    end

    it "should have a mood button" do
      get :home
      response.should have_selector("a", :href=>mood_path)
    end

    it "should have the right title" do
      get 'home'
      response.should have_selector("title", :content => "Home")
    end

  end 

  describe "GET Mood" do
    
    it "should have a successful mood page" do
      get 'mood'
      response.should be_success
    end

    it "should have a home button" do
      get 'mood'
      response.should have_selector("a", :href=>root_path)
    end

    it "should set the city varible" do
      get :mood
      assigns(:city).should_not be_nil
    end

    it "should set the temp varible" do
      get :mood
      assigns(:temp).should_not be_nil
    end

    it "should set the temp color" do
      get :mood
      assigns(:tempcolor).should_not be_nil
    end

  end

end
