require 'spec_helper'

describe "Index" do
	describe "GET" do
		it "contains a header section" do
			get "/"
			response.should have_selector("section", :id => 'header')
		end
		it "contains a login link" do
			get "/"
			response.should have_selector("a", :content => "Login")
		end
	end
end
