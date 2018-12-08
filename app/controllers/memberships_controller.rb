class MembershipsController < InheritedResources::Base

  private

    def membership_params
      params.require(:membership).permit(:name)
    end
end

