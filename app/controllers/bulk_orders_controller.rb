class BulkOrdersController < ApplicationController
  before_action :set_bulk_order, only: %i[ show edit update destroy ]

  # GET /bulk_orders or /bulk_orders.json
  def index
    @bulk_orders = BulkOrder.all
  end

  # GET /bulk_orders/1 or /bulk_orders/1.json
  def show
  end

  # GET /bulk_orders/new
  def new
    @bulk_order = BulkOrder.new
  end

  # GET /bulk_orders/1/edit
  def edit
  end

  # POST /bulk_orders or /bulk_orders.json
  def create
    @bulk_order = BulkOrder.new(bulk_order_params)

    respond_to do |format|
      if @bulk_order.save
        format.html { redirect_to @bulk_order, notice: "Bulk order was successfully created." }
        format.json { render :show, status: :created, location: @bulk_order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bulk_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bulk_orders/1 or /bulk_orders/1.json
  def update
    respond_to do |format|
      if @bulk_order.update(bulk_order_params)
        format.html { redirect_to @bulk_order, notice: "Bulk order was successfully updated." }
        format.json { render :show, status: :ok, location: @bulk_order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bulk_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bulk_orders/1 or /bulk_orders/1.json
  def destroy
    @bulk_order.destroy
    respond_to do |format|
      format.html { redirect_to bulk_orders_url, notice: "Bulk order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bulk_order
      @bulk_order = BulkOrder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bulk_order_params
      params.require(:bulk_order).permit(:reference_number, :pick_up, :total_weight)
    end
end
