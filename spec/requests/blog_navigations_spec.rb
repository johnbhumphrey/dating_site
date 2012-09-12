require 'spec_helper'

describe "BlogNavigations" do
	let(:user) { create(:user) }	
	before { valid_signin(user) }

	describe "creating a new blog" do
		describe "as a non admin" do
			it "should visit the new blog path and not be able to create a blog" do
				get new_blog_path
				response.should redirect_to(root_path)
			end
		end

		describe "as an admin" do
			before { user.toggle!(:admin) }
			before { @attr= { title: "Valid title", body: "Valid body"} }
			it "should visit the new blog path and create a blog" do
				visit new_blog_path	
				response.should have_selector('h1', content: "Create a new blog post")
				fill_in :title, with: @attr[:title]
				fill_in :body, with: @attr[:body]
				expect { click_button "Submit" }.to change(Blog, :count).by(1)
				response.should have_selector('div.success', content: "Blog successfully created.")
				response.should have_selector('h1', content: @attr[:title])
				response.should have_selector('p', content: @attr[:body])
			end

			it "should rerender the new page if the blog is invalid" do
				visit new_blog_path	
				fill_in :title, with: ""
				fill_in :body, with: ""
				expect { click_button "Submit" }.not_to change(Blog, :count)
				response.should have_selector('h1', content: "Create a new blog post")
			end
		end
	end

end
