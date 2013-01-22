class ProductsController < ApplicationController
  # GET /products
  # GET /products.json


    require "net/http"
    require "uri"

  before_filter :display_sort, :only => [:new, :edit,:create ]
  after_filter :update_sort, :only => [:update, :create]

  def index
    @product = Product.first(:order => 'sort asc', :conditions => ["sort != 0 and active = ?", true])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  def buy
    @product = Product.find(params[:id])
    @product.quantity -= 1
    @product.save
    if @product.quantity <= 0
      @product.active = false
      @product.sort = 0
      @product.save
    end
    redirect_to cart_url(@product)
  end

  def cart
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])
    @changed = @product.sort_changed?
    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  private

  def display_sort
    @products = Product.all
  end

  def update_sort
    @conflict = false
    @update = Product.where("sort >= ? and id <> ?", @product.sort, @product.id)
    if Product.find_by_sort(@product.sort) != "[]"
      @conflict = true
    elsif @changed == true
      @conflict = true
    end
      if @conflict == true
        @hey = @product.sort
        @update.each do |u|
          @hey += 1
          u.update_column(:sort, @hey)
          u.save
        end
      end
    end
    
end

