require 'rails_helper'

RSpec.describe "blogs/edit", type: :view do
  before(:each) do
    @blog = assign(:blog, Blog.create!(
      :title => "MyText",
      :text => "MyText",
      :user_id => 1
    ))
  end

  it "renders the edit blog form" do
    render

    assert_select "form[action=?][method=?]", blog_path(@blog), "post" do

      assert_select "textarea#blog_title[name=?]", "blog[title]"

      assert_select "textarea#blog_text[name=?]", "blog[text]"

      assert_select "input#blog_user_id[name=?]", "blog[user_id]"
    end
  end
end
