class AdministratorController < BaseController
  unloadable
  before_filter :get_mod , :only => [:show_index,:new,:create,:edit,:update,:destroy]


  def index
#  @mods =  [User,Keyword,Company,Brand,Product]
  @mods =  Administrator.admin_classes
  end

  def show_index

    @objects = @mod.paginate :page => params[:page], :per_page => @per_page
    @columns =  @mod.admin_columns

  end

  def edit
    @object =     @mod.find(params[:id])
  end

  def update
    @object =     @mod.find(params[:id])
    if @object.update_attributes(params[param_name(@mod).to_sym])
      flash[:notice] = "successfully updated #{@mod.to_s}"
      redirect_to administrator_index_path(@mod.to_s)
    else
      render :action => :edit

      end
  end

  def destroy
     @object =     @mod.find(params[:id])
    if @object.destroy
      flash[:notice] = "successfully deleted #{@mod.to_s}"
      redirect_to administrator_index_path(@mod.to_s)
    else
      render :action => :edit

      end
  end

  def new
   @object = @mod.new

  end

  def create
  @object =     @mod.new(params[param_name(@mod).to_sym] )

    if @object.save
      flash[:notice] = "successfully created #{@mod.to_s}"
      redirect_to administrator_index_path(@mod.to_s)
    else
      render :action => :new
      
      end

  end

private

  def get_mod
    @mod = params[:mod]
    @mod = @mod.constantize

  end

  def param_name(mod)
      mod.to_s.tableize.singularize
  end
end
