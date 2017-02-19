#coding=utf-8
Rails.application.routes.draw do

  resources :comments
  match '/playing/(:tv_code).html',to: 'welcome#playing', via: :get, as: :video_playing
  match '/search_playing/(:video_type)/(:tv_code).html',to: 'welcome#search_playing', via: :get, as: :video_search_playing
  match '/search/(:video_type)',to: 'welcome#search', via: :get, as: :video_search
  match '/check_search/(:video_type)/(:video_id)',to: 'welcome#check_search', via: :get, as: :check_search
  match '/channel/:english',to: 'welcome#channel', via: :get, as: :video_channel
  match '/videos/get_channel_more',to: 'welcome#get_channel_more', via: :get
  match '/videos/get_index_more',to: 'welcome#get_index_more', via: :get
  match '/v_show/(:youku_url)',to: 'welcome#interim', via: :get, as: :youku_play
  match '/feed',to: 'welcome#feed', via: :get, as: :feed, defaults: { format: :xml }
  match '/channel/:english/feed',to: 'welcome#feed', via: :get, as: :channel_feed, defaults: { format: :xml }
  match 'tlt/dashboard', to: 'administer/dashboard#index',via: :get, as: :dashboard
  match 'tlt/:english/videos', to: 'administer/dashboard#channel',via: :get, as: :channel
  match 'tlt/users', to: 'administer/dashboard#users',via: :get, as: :users
  match 'tlt/search', to: 'administer/dashboard#search',via: :get, as: :search
  match 'tlt/role_set', to: 'administer/dashboard#role_control',via: :get, as: :role_set
  match 'tlt/columns', to: 'administer/columns#index',via: :get, as: :columns
  match 'tlt/set_skin', to: 'administer/dashboard#set_skin_style',via: :get, as: :set_skin
  match 'tlt/import/:column_id', to: 'administer/columns#import_videos',via: :get, as: :import_column_video
  match 'tlt/create/import', to: 'administer/columns#create_csv_data',via: :post, as: :create_import_video
  match 'tlt/sign_in', to: 'administer/sessions#admin_sign_in',via: :get, as: :admin_sign_in
  match 'tlt/sign_out', to: 'administer/sessions#admin_sign_out',via: :get, as: :admin_sign_out
  match 'tlt/files', to: 'administer/seven_cattle#index',via: :get, as: :files
  match 'tlt/files/new', to: 'administer/seven_cattle#new',via: :get, as: :new_file
  match 'tlt/files/edit', to: 'administer/seven_cattle#edit',via: :get, as: :edit_file
  match 'tlt/files/delete', to: 'administer/seven_cattle#destroy',via: :get, as: :delete_file
  match 'tlt/files/create', to: 'administer/seven_cattle#create',via: :post, as: :create_file
  match 'tlt/files/update', to: 'administer/seven_cattle#update',via: :post, as: :update_file
  post 'tlt/admin_login', to: 'administer/sessions#admin_sign_login', as: :admin_login
  match 'tlt' => redirect('/tlt/dashboard'), via: :get
  match '/my/avatar',to: 'users/profile#new_avatar', via: :get, as: :new_avatar
  match '/my/profile',to: 'users/profile#profile', via: :get, as: :profile
  match '/create/avatar',to: 'users/profile#create_avatar', via: :post, as: :create_avatar
  match '/update/profile',to: 'users/profile#update_profile', via: :post, as: :update_profile
  match '/video/comment', to: 'comments#create', via: :post
  match '/video/comment/vote', to: 'comments#vote', via: :get
  match '/tlt/videos/:id/export', to: 'administer/columns#export_video', via: :get, as: :export_video
  namespace :administer, path:'/tlt' do
    resources :columns do
      resources :videos
    end
  end

  devise_for :users, controllers:{
       sessions: 'users/sessions',
       registrations: 'users/registrations',
       passwords: 'users/passwords'
   }
  devise_scope :user do
    get 'sign_in', to: 'users/sessions#new'
    get 'sign_up', to: 'users/registrations#new'
    post 'sign_in', to: 'users/sessions#create'
    get 'sign_out', to: 'users/sessions#destroy'
    get 'forgot_password', to: 'users/passwords#new'
    post 'forgot_password', to: 'users/passwords#create'
    get 'reset_password', to: 'users/passwords#edit'
    put 'reset_password', to: 'users/passwords#update'
  end
  root 'welcome#index'

  namespace :api do
    get 'echo_msg' => 'we_chat#echo_get_msg'
    post 'echo_msg' => 'we_chat#echo_post_msg'
  end

end
