class Refinery::Menus::Admin::MenuLinksController < Refinery::AdminController
  def create
    respond_to do |format|
      format.js do
        @menu_links = []
        if params[:resource_ids]
          params[:resource_ids].each do |id|
            @menu_links << Refinery::Menus::MenuLink.create({resource_id: id}.merge(params[:menu_link]))
          end
        else
          @menu_links << Refinery::Menus::MenuLink.create(params[:menu_link])
        end
      end
    end
  end

  def destroy
    respond_to do |format|
      format.js do
        @menu_link = Refinery::Menus::MenuLink.find(params[:id])
        @menu_link.destroy
      end
    end
  end
end
