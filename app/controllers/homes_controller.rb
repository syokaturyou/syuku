class HomesController < ApplicationController
  # 最初の画面
  def top
    # @articles = Article.all.order(updated_at: 'DESC').page(params[:page]).per(10)
  end
end