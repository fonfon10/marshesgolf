class ActivitiesController < InheritedResources::Base

  private

    def activity_params
      params.require(:activity).permit(:name)
    end
end

