class NotesController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user,   only: :destroy

    def new
        @note = Note.new
        @user_id = current_user.id
    end

    def create
        @note = current_user.notes.build(note_params)
        if @note.save
            flash[:success] = "ノートを作成しました！"
            redirect_to post_list_path(@user_id)
        else
            redirect_to action: :new
        end
    end

    def destroy
        @note.destroy
        flash[:success] = "Noteを削除しました"
        redirect_to controller: :users, action: :show
    end
    
    private
    
    def note_params
      params.require(:note).permit(:content,:picture)
    end

    def correct_user
        @note = current_user.notes.find_by(id: params[:id])
        redirect_to root_url if @note.nil?
    end
    
end
