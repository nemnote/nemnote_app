class NotesController < UsersController
    before_action :logged_in_user, only: [:create, :destroy]

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
    end
    
    private
    
    def note_params
      params.require(:note).permit(:content)
    end
    
end
