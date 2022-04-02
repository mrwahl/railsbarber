class HomeController < ApplicationController
    before_action :set_customer, only: %i[ show edit update destroy ]
   #before we run anything if the user is not signed in show index and show functions
   before_action :authenticate_user!, except: [:index,:show]
   #only the correct user can edit,update and destroy
   before_action :correct_user, only: [:edit, :update , :destroy]
    def home
    end
  end