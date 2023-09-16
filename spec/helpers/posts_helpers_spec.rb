require 'rails_helper'

include PostsHelper

RSpec.describe PostsHelper, type: :helper do
  it 'assigns a user to a post' do
    creator = User.first_or_create!(email: 'travis@example.com', 
        first_name: 'Travis', 
        last_name: 'Williams', 
        password: 'password', 
        password_confirmation: 'password')
    @post = Post.new(
      title: 'MyString',
      body: 'MyText',
    )
    assign_post_creator(@post, creator)
    expect(@post.user).to be(creator)
  end
end