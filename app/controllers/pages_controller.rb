class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :contact, :infos ]

  def home
  end

  def contact
  end

  def infos
  end
end
