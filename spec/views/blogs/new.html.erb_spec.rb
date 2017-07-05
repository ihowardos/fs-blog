require 'rails_helper'

RSpec.describe "blogs/new", type: :view do
  before(:each) do
    assign(:blog, Blog.new(
      :title => "MyText",
      :text => "MyText",
      :user_id => 1
    ))
  end

  it "renders new blog form" do
    render

    assert_select "form[action=?][method=?]", blogs_path, "post" do

      assert_select "textarea#blog_title[name=?]", "blog[title]"

      assert_select "textarea#blog_text[name=?]", "blog[text]"

      assert_select "input#blog_user_id[name=?]", "blog[user_id]"
    end
  end
end
