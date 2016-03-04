class ProductsController < ApplicationController
	# GET /products
	def index
		@products = Product.all
		render json: @products
	end

  	# GET /products/:id
	def show
		@product = Product.find(params[:id])
		render json: @product
	end

	# POST /products
	def create
		product = Product.new(product_params)
		product.save # save to DB
	end

	# PUT /products/:id
	def update
		@product = Product.find(params[:id])

		@product.update(product_params)
	end

	# DELETE /products/:id
	def destroy
		@product = Product.find(params[:id])
		@product.destroy
	end

	private 

    def product_params
      params.require(:product).permit(:name, :description, :price)
    end
end
