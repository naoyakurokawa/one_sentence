require 'rails_helper'

describe '投稿管理機能', type: :system do
  describe '一覧表表示' do
    before do
      user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')
      FactoryBot.create(:post, book_title: '最初の投稿', sentence1: 'aaa', user: user_a)
    end

    context 'ユーザーAがログインしている時' do
      before do
        visit login_path
        fill_in 'メールアドレス', with: 'a@example.com'
        fill_in 'パスワード', with: 'password'
        click_button 'ログインする'
      end

      it 'ユーザーAの投稿が表示される' do
        expect(page).to have_content '最初の投稿'
      end
    end
  end
end
