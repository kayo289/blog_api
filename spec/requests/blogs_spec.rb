require 'rails_helper'

RSpec.describe "Blogs", type: :request do
  describe "GET /api/v1/blogs" do
    context '一覧データを正しく取得できる' do
      it "リクエストは200になること" do
        get api_v1_blogs_path
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "GET /api/v1/blogs/:id" do
    context '一件のデータを正しく取得できる' do
      before do
        @blog = Blog.new
        @blog.title = "good day"
        @blog.summary = "very good day"
        @blog.uid = 1
        @blog.save
      end
      it "リクエストは200になること" do
        get api_v1_blog_path(1)
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "POST /api/v1/blogs/:id" do
    context 'トークンを一緒に渡さずにpostをリクエストしたらstatusが403が返ってくるかどうか' do
      it "リクエストは403になること" do
        post api_v1_blogs_path()
        expect(response).to have_http_status(403)
      end
    end
  end

  describe "DELETE /api/v1/blogs/:id" do
    context 'トークンを一緒に渡さずにアクセスしたらstatusが403が返ってくるかどうか' do
      before do
        @blog = Blog.new
        @blog.title = "good day"
        @blog.summary = "very good day"
        @blog.uid = 1
        @blog.save
      end
      it "リクエストはになること" do
        delete api_v1_blog_path(1)
        expect(response).to have_http_status(403)
      end
    end
  end

  describe "DELETE /api/v1/blogs/:id" do
    context 'トークンを一緒に渡さずにアクセスしたらstatusが403が返ってくるかどうか' do
      before do
        @blog = Blog.new
        @blog.title = "good day"
        @blog.summary = "very good day"
        @blog.uid = 1
        @blog.save
      end
      it "リクエストは403になること" do
        put api_v1_blog_path(1)
        expect(response).to have_http_status(403)
      end
    end
  end
end
