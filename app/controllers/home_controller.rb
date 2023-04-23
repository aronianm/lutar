class HomeController < ApplicationController
  def index
  end
  def features
  end
  def contact 
  end
  def company
  end
  def trainors
    @trainors = Trainor.all
  end
end
