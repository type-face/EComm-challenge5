class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  validation :title, :price, :stock_quantity, :presence => true

  # GET /products
  # GET /products.json
  def index
    @products = Product.all


    first_product = Product.create(title: 'Product1', description: '1st product', price: 5.5, stock_quantity: 1)
    second_product = Product.create(title: 'Product2', description: '2nd product', price: 6.6, stock_quantity: 2)
    third_product = Product.create(title: 'Product3', description: '3rd product', price: 7.7, stock_quantity: 3)
    fourth_product = Product.create(title: 'Product4', description: '4th product', price: 8.8, stock_quantity: 4)
    fifth_product = Product.create(title: 'Product5', description: '5th product', price: 9.9, stock_quantity: 5)
    
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, :price, :stock_quantity)
    end

end
