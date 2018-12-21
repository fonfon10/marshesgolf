class OpenClosesController < InheritedResources::Base

  private

    def open_close_params
      params.require(:open_close).permit(:name)
    end
end

