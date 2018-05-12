class NotesController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user,   only: :destroy

    def new
        @note = Note.new
        @user_id = current_user.id
        @categories = Category.all
    end

    def create
        @note = current_user.notes.build(note_params)
        if @note.save
            flash[:success] = "ノートを作成しました！"
            redirect_to post_list_path(@user_id)
        else
            flash[:danger] = "エラー！"
            redirect_to action: :new
        end
    end

    def destroy
        @note.destroy
        flash[:success] = "Noteを削除しました"
        redirect_to controller: :users, action: :show
    end

    def show
        @user = current_user
        @notes = Note.all.order(created_at: :asc).paginate(page: params[:page])
        @categories = Category.all
    end

    def url
        @url = params[:url]
        respond_to do |format|
            format.html
            format.js
        end
    end

    def post_notes
        @note = Note.find(params[:id])
        if @note.price_status == 1 && @note.buy != 1
            redirect_to action: :buy_note, id: @note.id
        end
    end

    def buy_note
        @note = Note.find(params[:id])
        if @note.price_status == 0
            redirect_to action: :post_notes, id:@note.id
        end
    end

    def buy_note_create
        @note = Note.find(params[:id])
        @note.buy = 1
        if @note.save
            redirect_to action: :post_notes, id:@note.id
            flash[:success] = "購入しました"
        else
            flash[:danger] = "購入に失敗しました"
        end
    end

    private
    
    def note_params
      params.require(:note).permit(:content,:picture,:title,:category,:user_id,:price,:price_status,:buy)
    end

    def correct_user
        @note = current_user.notes.find_by(id: params[:id])
        redirect_to root_url if @note.nil?
    end
    
end
