require 'rails_helper'

RSpec.describe "comments/edit", type: :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      :user => nil,
      :blog => nil,
      :text => "MyText"
    ))
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do

      assert_select "input#comment_user_id[name=?]", "comment[user_id]"

      assert_select "input#comment_blog_id[name=?]", "comment[blog_id]"

      assert_select "textarea#comment_text[name=?]", "comment[text]"
    end
  end
end
