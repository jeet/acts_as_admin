class AdministratorController < BaseController
  before_filter :get_mod , :only => [:show_index]
   unloadable

  def index
#  @mods =  [User,Keyword,Company,Brand,Product]
  @mods =  Administrator.admin_classes
  end

  def show_index

    @objects = @mod.constantize.paginate(:all,:page =>2)
    @columns =  @mod.constantize.column_names

  end

  def edit
  end

  def update
  end

  def destroy
  end

  def new
  end

  def create
  end

private

  def get_mod
    @mod = params[:mod]

  end
end
