class NotesController < ApplicationController
  before_action :set_note, only: %i[ show update destroy ]

  # GET /notes
  def index
    @notes = Note.all

    # 1. BỘ LỌC (FILTERING) - Giữ nguyên của bước trước
    if params[:title].present?
      @notes = @notes.where("title ILIKE ?", "%#{params[:title]}%")
    end

    # 2. PHÂN TRANG (PAGINATION) - MỚI THÊM
    # Lấy số trang từ URL (mặc định là trang 1 nếu không truyền)
    page = (params[:page] || 1).to_i
    # Lấy số lượng note mỗi trang (mặc định là 5 cái mỗi trang)
    per_page = (params[:per_page] || 5).to_i
    
    # Tính toán vị trí bắt đầu lấy dữ liệu bằng SQL Offset
    offset = (page - 1) * per_page
    @notes = @notes.limit(per_page).offset(offset)

    render json: @notes
  end

  # GET /notes/1
  def show
    render json: @note
  end

  # POST /notes
  def create
    @note = Note.new(note_params)

    if @note.save
      render json: @note, status: :created, location: @note
    else
      render json: @note.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /notes/1
  def update
    if @note.update(note_params)
      render json: @note
    else
      render json: @note.errors, status: :unprocessable_content
    end
  end

  # DELETE /notes/1
  def destroy
    @note.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def note_params
      params.require(:note).permit(:title, :content)
    end
end