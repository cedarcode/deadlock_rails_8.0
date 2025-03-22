# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :system do
  describe 'all actions' do
    it 'tries all the flows' do
      visit posts_path

      click_on 'New post'

      fill_in 'Title', with: 'My first post'
      fill_in 'Content', with: 'This is my first post'

      click_on 'Create Post'

      expect(page).to have_content('Post was successfully created.')
      expect(page).to have_content('My first post')
      expect(page).to have_content('This is my first post')

      expect(page).to have_current_path(post_path(Post.last))

      visit post_path(Post.last)

      expect(page).to have_content('My first post')
      expect(page).to have_content('This is my first post')

      click_on 'Edit this post'

      fill_in 'Title', with: 'My first post edited'
      fill_in 'Content', with: 'This is my first post edited'

      click_on 'Update Post'

      expect(page).to have_content('Post was successfully updated.')
      expect(page).to have_content('My first post edited')
      expect(page).to have_content('This is my first post edited')

      click_on 'Back to posts'

      expect(page).to have_content('My first post edited')
      expect(page).to have_content('This is my first post edited')

      visit post_path(Post.last)

      click_on 'Destroy this post'

      expect(page).to have_content('Post was successfully destroyed.')
    end
  end
end
