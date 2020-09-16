class ArticlesController < ApplicationController

    get '/articles' do 
        @articles = Article.all
        erb :"articles/index"
    end

    get '/articles/new' do
        erb :"articles/new"
    end

    post '/articles' do
        @article = Article.create(params)
        redirect to "/articles/#{@article.id}"
    end

    get '/articles/:id' do
        @article = Article.find(params[:id])
        erb :"articles/show"
    end

    get '/articles/:id/edit' do
        @article = Article.find(params[:id])
        erb :"articles/edit"
    end

    patch '/articles/:id' do
        @article = Article.find_by(id: params[:id])
        @article.update(params[:article])
        redirect to "/articles/#{@article.id}"
    end

    delete '/articles/:id' do
        Article.destroy(params[:id])
        redirect to '/articles'
    end
end