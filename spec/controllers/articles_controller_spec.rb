require 'rails_helper'

RSpec.describe ArticlesController do
  let(:valid_attributes) {
    { title: 'One Stupid Trick', body: "You won't believe what happens next..." }
  }

  let(:invalid_attributes) {
    { title: nil, body: nil }
  }

  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq 200
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'assigns @articles' do
      # setup
      articles = Article.all
      # execute
      get :index
      # verify
      expect(assigns(:articles)).to eq articles
    end
  end

  describe 'GET show' do
    it 'has a 200 status code' do
      article = Article.create!(valid_attributes)
      get :show, id: article
      expect(response.status).to eq 200
    end

    it 'renders the show template' do
      article = Article.create!(valid_attributes)
      get :show, id: article
      expect(response).to render_template('show')
    end

    it 'assigns @article' do
      article = Article.create!(valid_attributes)
      get :show, id: article
      expect(assigns(:article)).to eq article
    end
  end

  describe 'GET new' do
    it 'has a 200 status code' do
      get :new
      expect(response.status).to eq 200
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end

    it 'assigns @article' do
      # setup
      article = Article.new
      # execute
      get :new
      # verify
      expect(assigns(:article)).to be_a_new Article
    end
  end

  describe 'POST create' do
    context 'with valid attributes' do
      it 'saves a new article' do
        expect {
          post :create, article: valid_attributes
        }.to change(Article, :count).by 1
      end

      it 'assigns @article' do
        post :create, article: valid_attributes
        expect(assigns(:article)).to be_an Article
        expect(assigns(:article)).to be_persisted
      end

      it 'redirects to the created article' do
        post :create, article: valid_attributes
        expect(response).to redirect_to(Article.last)
      end
    end

    context 'with invalid attributes' do
      it 'assigns @article, but does not save a new article' do
        post :create, article: invalid_attributes
        expect(assigns(:article)).to be_a_new Article
      end

      it 're-renders the new template' do
        post :create, article: invalid_attributes
        expect(response).to render_template 'new'
      end
    end
  end

end





