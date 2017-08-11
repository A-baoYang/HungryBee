class CommentsController < ApplicationController
    def create
    # 找相關連的訂單
    @order = Order.find(params[:order_id])
    comment_params = params.require(:comment).permit(:content)
    # build 與 new 的意思一樣
    @comment = @order.comments.build(comment_params)
    # 綁定現在登入的使用者
    @comment.user = current_user

    if @comment.save
        flash[:success] = "Comment Success!"
        redirect_to order_path(@order)
    else
        flash[:danger] = "Comment Failed><"
        render 'orders/show'
    end
  end
end
